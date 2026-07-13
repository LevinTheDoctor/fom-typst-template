# ==============================================================================
# PDF-Build für Windows (PowerShell)
# ==============================================================================
# Verwendung (im Projektordner):
#   .\scripts\build.ps1           -> thesis.pdf erzeugen
#   .\scripts\build.ps1 -Watch    -> Live-Vorschau (automatisch neu kompilieren)
#
# Hinweis: Falls die Ausführung blockiert wird, einmalig erlauben mit:
#   Set-ExecutionPolicy -Scope CurrentUser RemoteSigned

param(
    [switch]$Watch,
    [string]$InputFile = "main.typ",
    [string]$OutputFile = "thesis.pdf"
)

$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

if (-not (Get-Command typst -ErrorAction SilentlyContinue)) {
    Write-Error @"
Typst ist nicht installiert.

Installation unter Windows:
  winget install --id Typst.Typst
  oder: choco install typst
  oder Binary von https://github.com/typst/typst/releases

Alternativ ohne Installation: make docker (bzw. Docker Desktop + Dockerfile)
"@
    exit 1
}

if ($Watch) {
    typst watch --font-path fonts $InputFile $OutputFile
} else {
    typst compile --font-path fonts $InputFile $OutputFile
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ $OutputFile erzeugt" -ForegroundColor Green
    } else {
        exit $LASTEXITCODE
    }
}
