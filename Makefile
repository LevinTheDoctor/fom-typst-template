# ==============================================================================
# FOM-Typst-Template – Build-Pipeline (Linux/macOS; Windows: scripts/build.ps1)
# ==============================================================================
# Die wichtigsten Ziele:
#   make            bzw. make build   -> thesis.pdf erzeugen
#   make watch                        -> Live-Vorschau (bei Änderungen neu bauen)
#   make check                        -> Kompilieren + Warnungen als Fehler
#   make docker                       -> PDF reproduzierbar im Container bauen
#   make clean                        -> Erzeugte Dateien entfernen

TYPST     ?= typst
INPUT     ?= main.typ
OUTPUT    ?= thesis.pdf
FONT_PATH ?= fonts

.PHONY: all build watch check clean docker

all: build

## PDF erzeugen
build:
	$(TYPST) compile --font-path $(FONT_PATH) $(INPUT) $(OUTPUT)
	@echo "✓ $(OUTPUT) erzeugt"

## Live-Vorschau: kompiliert bei jeder Änderung automatisch neu
watch:
	$(TYPST) watch --font-path $(FONT_PATH) $(INPUT) $(OUTPUT)

## Strenger Build für CI: bricht auch bei Warnungen ab
check:
	@ausgabe=$$($(TYPST) compile --font-path $(FONT_PATH) $(INPUT) $(OUTPUT) 2>&1); \
	status=$$?; \
	if [ -n "$$ausgabe" ]; then echo "$$ausgabe"; fi; \
	if [ $$status -ne 0 ] || [ -n "$$ausgabe" ]; then exit 1; fi
	@echo "✓ Kompiliert ohne Fehler und Warnungen"

## Reproduzierbarer Build im Docker-Container (ohne lokale Typst-Installation)
docker:
	docker build -t fom-typst-template .
	docker run --rm -v "$(CURDIR)":/arbeit fom-typst-template

clean:
	rm -f $(OUTPUT)
