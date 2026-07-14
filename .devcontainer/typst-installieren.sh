#!/usr/bin/env bash
# Installiert die Typst-CLI im Dev-Container (Linux, x86_64 oder arm64).
set -euo pipefail

if command -v typst >/dev/null 2>&1; then
  echo "Typst ist bereits installiert: $(typst --version)"
  exit 0
fi

ARCH="$(uname -m)"
case "$ARCH" in
  x86_64) ZIEL="x86_64-unknown-linux-musl" ;;
  aarch64 | arm64) ZIEL="aarch64-unknown-linux-musl" ;;
  *)
    echo "Nicht unterstützte Architektur: $ARCH" >&2
    exit 1
    ;;
esac

URL="https://github.com/typst/typst/releases/latest/download/typst-${ZIEL}.tar.xz"
echo "Lade Typst von $URL ..."
curl -fsSL "$URL" | tar -xJ -C /tmp
sudo mv "/tmp/typst-${ZIEL}/typst" /usr/local/bin/typst
echo "✓ Installiert: $(typst --version)"
