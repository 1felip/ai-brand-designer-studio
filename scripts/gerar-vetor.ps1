<#
.SYNOPSIS
  Gera vetores SVG com Recraft (via API do Replicate).

.DESCRIPTION
  Dois modos:
  - Prompt   -> recraft-ai/recraft-v3-svg   (gera um vetor novo a partir de texto)
  - Vetorizar-> recraft-ai/recraft-vectorize (converte um PNG APROVADO em SVG, preservando a forma)
  Fluxo recomendado do /logo: aprovar o PNG (Nano Banana) e depois usar -Vetorizar.
  O token vem SOMENTE da variavel de ambiente REPLICATE_API_TOKEN (processo ou usuario).

.PARAMETER Prompt      Texto do prompt (ingles).
.PARAMETER PromptFile  Alternativa: arquivo .txt com o prompt.
.PARAMETER Vetorizar   Caminho de um PNG/JPG aprovado para converter em SVG.
.PARAMETER Paleta      Modo vetorizar: HEX separados por virgula (ex.: "#0A1628,#5EE6A8,#FFD23F").
                       Quantiza a imagem para essas cores antes de enviar (recomendado).
.PARAMETER Tamanho     Modo prompt: 1024x1024 (padrao), 1365x1024, 1024x1365.
.PARAMETER Saida       Caminho do SVG de saida (ex.: assets/logos/logo-001-slug-c1.svg).
#>
param(
  [string]$Prompt,
  [string]$PromptFile,
  [string]$Vetorizar,
  [string]$Paleta,
  [string]$Tamanho = '1024x1024',
  [Parameter(Mandatory = $true)][string]$Saida
)

$ErrorActionPreference = 'Stop'

$tok = $env:REPLICATE_API_TOKEN
if (-not $tok) { $tok = [Environment]::GetEnvironmentVariable('REPLICATE_API_TOKEN', 'User') }
if (-not $tok) { throw 'REPLICATE_API_TOKEN nao configurado. Defina como variavel de ambiente do usuario.' }

if ($Vetorizar) {
  $modelo = 'recraft-ai/recraft-vectorize'
  # Data URL tem limite de ~256 KB: reduz para 1024px PNG (logos chapados ficam bem abaixo disso)
  Add-Type -AssemblyName System.Drawing
  $src = [System.Drawing.Image]::FromFile((Resolve-Path $Vetorizar))
  $lado = [Math]::Min(1024, $src.Width)
  $alt = [int]($src.Height * $lado / $src.Width)
  $bmp = New-Object System.Drawing.Bitmap $lado, $alt
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = 'HighQualityBicubic'; $g.DrawImage($src, 0, 0, $lado, $alt); $g.Dispose(); $src.Dispose()
  if ($Paleta) {
    # Quantiza cada pixel para a cor mais proxima da paleta: remove o ruido da IA e garante HEX exatos no SVG
    if (-not ('Quantizador' -as [type])) {
      Add-Type -ReferencedAssemblies System.Drawing -TypeDefinition @'
using System; using System.Drawing; using System.Drawing.Imaging; using System.Runtime.InteropServices;
public static class Quantizador {
  public static Bitmap Aplicar(Bitmap src, int[] r, int[] g, int[] b) {
    var bmp = src.Clone(new Rectangle(0, 0, src.Width, src.Height), PixelFormat.Format24bppRgb);
    var d = bmp.LockBits(new Rectangle(0, 0, bmp.Width, bmp.Height), ImageLockMode.ReadWrite, PixelFormat.Format24bppRgb);
    var buf = new byte[d.Stride * d.Height]; Marshal.Copy(d.Scan0, buf, 0, buf.Length);
    for (int y = 0; y < d.Height; y++) for (int x = 0; x < d.Width; x++) {
      int i = y * d.Stride + x * 3, best = 0, bd = int.MaxValue;
      for (int k = 0; k < r.Length; k++) {
        int dr = buf[i+2]-r[k], dg = buf[i+1]-g[k], db = buf[i]-b[k], dist = dr*dr+dg*dg+db*db;
        if (dist < bd) { bd = dist; best = k; }
      }
      buf[i+2] = (byte)r[best]; buf[i+1] = (byte)g[best]; buf[i] = (byte)b[best];
    }
    Marshal.Copy(buf, 0, d.Scan0, buf.Length); bmp.UnlockBits(d); return bmp;
  }
}
'@
    }
    $cores = $Paleta -split ',' | ForEach-Object { $_.Trim().TrimStart('#') }
    $rr = [int[]]($cores | ForEach-Object { [Convert]::ToInt32($_.Substring(0,2),16) })
    $gg = [int[]]($cores | ForEach-Object { [Convert]::ToInt32($_.Substring(2,2),16) })
    $bb = [int[]]($cores | ForEach-Object { [Convert]::ToInt32($_.Substring(4,2),16) })
    $q = [Quantizador]::Aplicar($bmp, $rr, $gg, $bb); $bmp.Dispose(); $bmp = $q
  }
  $ms = New-Object IO.MemoryStream; $bmp.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png); $bmp.Dispose()
  if ($ms.Length -gt 256KB) { throw "Imagem ainda grande demais para data URL ($([int]($ms.Length/1KB)) KB)." }
  $entrada = @{ image = 'data:image/png;base64,' + [Convert]::ToBase64String($ms.ToArray()) }
} else {
  $modelo = 'recraft-ai/recraft-v3-svg'
  if ($PromptFile) { $Prompt = Get-Content -Raw -Encoding UTF8 $PromptFile }
  if (-not $Prompt) { throw 'Informe -Prompt, -PromptFile ou -Vetorizar.' }
  $entrada = @{ prompt = $Prompt; size = $Tamanho }
}

$body = @{ input = $entrada } | ConvertTo-Json -Depth 5 -Compress
$h = @{ Authorization = "Bearer $tok"; Prefer = 'wait=60' }

try {
  $r = Invoke-RestMethod -Method Post -Uri "https://api.replicate.com/v1/models/$modelo/predictions" `
    -Headers $h -ContentType 'application/json; charset=utf-8' -Body ([Text.Encoding]::UTF8.GetBytes($body))
  while ($r.status -in 'starting', 'processing') {
    Start-Sleep -Seconds 3
    $r = Invoke-RestMethod -Uri $r.urls.get -Headers @{ Authorization = "Bearer $tok" }
  }
} catch {
  $msg = $_.ErrorDetails.Message
  if (-not $msg -and $_.Exception.Response) {
    try { $msg = (New-Object IO.StreamReader($_.Exception.Response.GetResponseStream())).ReadToEnd() } catch {}
  }
  if (-not $msg) { $msg = $_.Exception.Message }
  throw "Falha no Replicate ($modelo): $msg"
}

if ($r.status -ne 'succeeded') { throw "Predicao terminou como $($r.status): $($r.error)" }
$url = if ($r.output -is [array]) { $r.output[0] } else { $r.output }

$dir = Split-Path -Parent $Saida
if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
Invoke-WebRequest -Uri $url -OutFile $Saida -UseBasicParsing

"OK $modelo -> $Saida"
