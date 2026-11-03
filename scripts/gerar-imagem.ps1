<#
.SYNOPSIS
  Gera imagens raster (PNG) com Nano Banana (Google Gemini API).

.DESCRIPTION
  Usado por /post, /capa, /carrossel e /logo (exploracao e lockups).
  A chave vem SOMENTE da variavel de ambiente GEMINI_API_KEY (processo ou usuario).
  Nunca grave a chave em arquivos: o repositorio e publico.

.PARAMETER Prompt       Texto do prompt (ingles).
.PARAMETER PromptFile   Alternativa: arquivo .txt com o prompt.
.PARAMETER Negative     Negative prompt. O Gemini nao tem campo de negative; ele e anexado como "Avoid: ...".
.PARAMETER Modelo       pro (final, padrao) | flash (rascunho) | lite (rascunho barato) | ID completo do modelo.
.PARAMETER Proporcao    1:1, 4:5, 9:16, 16:9, 3:4, 4:3, 2:3, 3:2, 5:4, 21:9 (flash tambem aceita 4:1, 1:4, 8:1, 1:8).
.PARAMETER Tamanho      1K | 2K (padrao) | 4K. Sempre K maiusculo.
.PARAMETER Referencias  Caminhos de imagens de referencia (template, frame do corte, logo). Pro: ate 14.
.PARAMETER Saida        Caminho do PNG de saida (ex.: assets/posts/post-001-slug-v1.png).

.EXAMPLE
  ./scripts/gerar-imagem.ps1 -PromptFile prompts/posts/post-001.txt -Proporcao 4:5 -Saida assets/posts/post-001-x-v1.png
#>
param(
  [string]$Prompt,
  [string]$PromptFile,
  [string]$Negative = '',
  [string]$Modelo = 'pro',
  [string]$Proporcao = '1:1',
  [ValidateSet('1K','2K','4K')][string]$Tamanho = '2K',
  [string[]]$Referencias = @(),
  [Parameter(Mandatory = $true)][string]$Saida
)

$ErrorActionPreference = 'Stop'

$modelos = @{
  'pro'   = 'gemini-3-pro-image'          # Nano Banana Pro: melhor tipografia e fidelidade a referencias
  'flash' = 'gemini-nano-banana-2.1'      # Nano Banana 2.1: rascunhos e iteracoes
  'lite'  = 'gemini-3.1-flash-lite-image' # Nano Banana 2 Lite: o mais barato
}
$modelId = if ($modelos.ContainsKey($Modelo)) { $modelos[$Modelo] } else { $Modelo }

$key = $env:GEMINI_API_KEY
if (-not $key) { $key = [Environment]::GetEnvironmentVariable('GEMINI_API_KEY', 'User') }
if (-not $key) { throw 'GEMINI_API_KEY nao configurada. Defina como variavel de ambiente do usuario.' }

if ($PromptFile) { $Prompt = Get-Content -Raw -Encoding UTF8 $PromptFile }
if (-not $Prompt) { throw 'Informe -Prompt ou -PromptFile.' }
if ($Negative) { $Prompt = "$Prompt`n`nAvoid: $Negative" }

$parts = @(@{ text = $Prompt })
foreach ($ref in $Referencias) {
  $ext = [IO.Path]::GetExtension($ref).ToLower()
  $mime = switch ($ext) { '.jpg' { 'image/jpeg' } '.jpeg' { 'image/jpeg' } '.webp' { 'image/webp' } default { 'image/png' } }
  $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes((Resolve-Path $ref)))
  $parts += @{ inline_data = @{ mime_type = $mime; data = $b64 } }
}

$body = @{
  contents         = @(@{ role = 'user'; parts = $parts })
  generationConfig = @{
    responseModalities = @('TEXT', 'IMAGE')
    imageConfig        = @{ aspectRatio = $Proporcao; imageSize = $Tamanho }
  }
} | ConvertTo-Json -Depth 10 -Compress

$uri = "https://generativelanguage.googleapis.com/v1beta/models/$($modelId):generateContent"
$headers = @{ 'x-goog-api-key' = $key }

try {
  $resp = Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -ContentType 'application/json; charset=utf-8' `
    -Body ([Text.Encoding]::UTF8.GetBytes($body)) -TimeoutSec 300
} catch {
  $msg = $_.ErrorDetails.Message
  if (-not $msg) { $msg = $_.Exception.Message }
  throw "Falha na Gemini API ($modelId): $msg"
}

$imgPart = $null
$texto = @()
foreach ($p in $resp.candidates[0].content.parts) {
  if ($p.inlineData) { $imgPart = $p.inlineData }
  elseif ($p.text) { $texto += $p.text }
}
if (-not $imgPart) {
  $motivo = $resp.candidates[0].finishReason
  throw "Nenhuma imagem retornada (finishReason: $motivo). Texto do modelo: $($texto -join ' ')"
}

$dir = Split-Path -Parent $Saida
if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
[IO.File]::WriteAllBytes((Join-Path (Get-Location) $Saida), [Convert]::FromBase64String($imgPart.data))

"OK $modelId $Proporcao $Tamanho -> $Saida"
if ($texto) { "Nota do modelo: $($texto -join ' ')" }
