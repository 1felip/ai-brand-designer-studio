<#
.SYNOPSIS
  Gera vetores SVG com Recraft V3 SVG (via API do Replicate).

.DESCRIPTION
  Usado por /logo (arquivo final) e por elementos de marca (pin, selos, icones).
  O token vem SOMENTE da variavel de ambiente REPLICATE_API_TOKEN (processo ou usuario).
  Chamada HTTP direta: funciona mesmo quando o Replicate MCP nao herdou o token.

.PARAMETER Prompt      Texto do prompt (ingles).
.PARAMETER PromptFile  Alternativa: arquivo .txt com o prompt.
.PARAMETER Tamanho     Ex.: 1024x1024 (padrao), 1365x1024, 1024x1365.
.PARAMETER Saida       Caminho do SVG de saida (ex.: assets/logos/logo-001-slug-c1.svg).
#>
param(
  [string]$Prompt,
  [string]$PromptFile,
  [string]$Tamanho = '1024x1024',
  [Parameter(Mandatory = $true)][string]$Saida
)

$ErrorActionPreference = 'Stop'

$tok = $env:REPLICATE_API_TOKEN
if (-not $tok) { $tok = [Environment]::GetEnvironmentVariable('REPLICATE_API_TOKEN', 'User') }
if (-not $tok) { throw 'REPLICATE_API_TOKEN nao configurado. Defina como variavel de ambiente do usuario.' }

if ($PromptFile) { $Prompt = Get-Content -Raw -Encoding UTF8 $PromptFile }
if (-not $Prompt) { throw 'Informe -Prompt ou -PromptFile.' }

$body = @{ input = @{ prompt = $Prompt; size = $Tamanho } } | ConvertTo-Json -Depth 5 -Compress
$h = @{ Authorization = "Bearer $tok"; Prefer = 'wait=60' }

try {
  $r = Invoke-RestMethod -Method Post -Uri 'https://api.replicate.com/v1/models/recraft-ai/recraft-v3-svg/predictions' `
    -Headers $h -ContentType 'application/json; charset=utf-8' -Body ([Text.Encoding]::UTF8.GetBytes($body))
  while ($r.status -in 'starting', 'processing') {
    Start-Sleep -Seconds 3
    $r = Invoke-RestMethod -Uri $r.urls.get -Headers @{ Authorization = "Bearer $tok" }
  }
} catch {
  $msg = $_.ErrorDetails.Message
  if (-not $msg) { $msg = $_.Exception.Message }
  throw "Falha no Replicate (recraft-v3-svg): $msg"
}

if ($r.status -ne 'succeeded') { throw "Predicao terminou como $($r.status): $($r.error)" }
$url = if ($r.output -is [array]) { $r.output[0] } else { $r.output }

$dir = Split-Path -Parent $Saida
if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force $dir | Out-Null }
Invoke-WebRequest -Uri $url -OutFile $Saida -UseBasicParsing

"OK recraft-v3-svg $Tamanho -> $Saida"
