#!/usr/bin/env bash
# ==============================================================================
# PDF-Build für Linux und macOS
# ==============================================================================
# Verwendung:
#   ./scripts/build.sh            -> thesis.pdf erzeugen
#   ./scripts/build.sh watch      -> Live-Vorschau (automatisch neu kompilieren)
set -euo pipefail

cd "$(dirname "$0")/.."

INPUT="${INPUT:-main.typ}"
OUTPUT="${OUTPUT:-thesis.pdf}"

if ! command -v typst >/dev/null 2>&1; then
  echo "Fehler: Typst ist nicht installiert." >&2
  echo "" >&2
  echo "Installation:" >&2
  echo "  macOS:  brew install typst" >&2
  echo "  Linux:  siehe https://github.com/typst/typst/releases (Binary)" >&2
  echo "          oder: cargo install --locked typst-cli" >&2
  echo "  Alternativ ohne Installation: make docker" >&2
  exit 1
fi

if [[ "${1:-}" == "watch" ]]; then
  exec typst watch --font-path fonts "$INPUT" "$OUTPUT"
else
  typst compile --font-path fonts "$INPUT" "$OUTPUT"
  echo "✓ $OUTPUT erzeugt"
fi
