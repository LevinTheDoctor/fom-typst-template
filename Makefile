# ==============================================================================
# FOM-Typst-Template – Build-Pipeline (Linux/macOS; Windows: scripts/build.ps1)
# ==============================================================================
# Die wichtigsten Ziele:
#   make            bzw. make build   -> thesis.pdf erzeugen
#   make watch                        -> Live-Vorschau (bei Änderungen neu bauen)
#   make check                        -> Kompilieren + Warnungen als Fehler
#   make wordcount                    -> Wortzahl des Textteils auslesen
#   make docs                         -> Dokumentations-Webseite bauen
#   make docs-dev                     -> Doku-Webseite lokal starten
#   make docker                       -> PDF reproduzierbar im Container bauen
#   make clean                        -> Erzeugte Dateien entfernen

TYPST     ?= typst
INPUT     ?= main.typ
OUTPUT    ?= thesis.pdf
FONT_PATH ?= fonts
WORTZAHL_LABEL ?= <word-count>

.PHONY: all build watch check wordcount clean docs docs-dev docker

all: build

## PDF erzeugen
build:
	$(TYPST) compile --font-path $(FONT_PATH) $(INPUT) $(OUTPUT)
	@$(MAKE) --no-print-directory wordcount
	@echo "✓ $(OUTPUT) erzeugt"

## Live-Vorschau: kompiliert bei jeder Änderung automatisch neu
watch:
	$(TYPST) watch --font-path $(FONT_PATH) $(INPUT) $(OUTPUT)

## Strenger Build für CI: bricht auch bei Warnungen ab. Ausnahmen: Der
## Fortschritts-Download von @preview-Paketen (z. B. wordometer) ist keine
## Warnung – solche Zeilen werden herausgefiltert. grep -v liefert bei
## vollständiger Filterung den Status 1, deshalb { grep || true; } – der
## typst-Status bleibt über pipefail erhalten.
check:
	@set -o pipefail; \
	ausgabe="$$($(TYPST) compile --font-path $(FONT_PATH) $(INPUT) $(OUTPUT) 2>&1 \
	          | { grep -v '^downloading @preview/' | grep -v 'B /' || true; })"; \
	status=$$?; \
	if [ -n "$$ausgabe" ]; then echo "$$ausgabe"; fi; \
	if [ $$status -ne 0 ] || [ -n "$$ausgabe" ]; then exit 1; fi
	@$(MAKE) --no-print-directory wordcount
	@echo "✓ Kompiliert ohne Fehler und Warnungen"

## Wortzahl aus dem Dokument auslesen und ausgeben (eigenständiges Target,
## damit build und check dieselbe Logik nutzen statt sie zu duplizieren).
## Voraussetzung: main.typ setzt die Marke <word-count> über das Paket
## wordometer (#word-count um den Textteil, siehe Doku).
wordcount:
	@wortanzahl=$$($(TYPST) query --font-path $(FONT_PATH) $(INPUT) "$(WORTZAHL_LABEL)" --field value --one 2>/dev/null); \
	if [ -n "$$wortanzahl" ]; then \
		echo "  Wörter: $$wortanzahl"; \
	fi

## Dokumentations-Webseite bauen (docs-app/dist)
docs:
	cd docs-app && npm install && npm run build

## Dokumentations-Webseite im Entwicklungsmodus starten
docs-dev:
	cd docs-app && npm install && npm run dev

## Reproduzierbarer Build im Docker-Container (ohne lokale Typst-Installation)
docker:
	docker build -t fom-typst-template .
	docker run --rm -v "$(CURDIR)":/arbeit fom-typst-template

clean:
	rm -f $(OUTPUT)
	rm -rf docs-app/dist
