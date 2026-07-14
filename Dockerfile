# ==============================================================================
# Reproduzierbarer PDF-Build ohne lokale Typst-Installation
# ==============================================================================
# Verwendung:
#   docker build -t fom-typst-template .
#   docker run --rm -v "$(pwd)":/arbeit fom-typst-template
# oder einfach: make docker
#
# Die Schriftart Liberation Serif liegt im Projektordner (/fonts) und wird
# über --font-path eingebunden – das PDF ist damit auf jedem System identisch.

FROM ghcr.io/typst/typst:latest

WORKDIR /arbeit

# Standardbefehl: main.typ -> thesis.pdf (kann beim Aufruf überschrieben werden)
ENTRYPOINT ["typst"]
CMD ["compile", "--font-path", "fonts", "main.typ", "thesis.pdf"]
