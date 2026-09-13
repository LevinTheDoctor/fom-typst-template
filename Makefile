# ==============================================================================
# FOM-Typst-Template – Build-Pipeline (Linux/macOS; Windows: scripts/build.ps1)
# ==============================================================================
# Die wichtigsten Ziele:
#   make            bzw. make build   -> thesis.pdf erzeugen
#   make watch                        -> Live-Vorschau (bei Änderungen neu bauen)
#   make check                        -> Kompilieren + Warnungen als Fehler
#   make wordcount                    -> Wortzahl des Textteils auslesen
#   make docker                       -> PDF reproduzierbar im Container bauen
#   make clean                        -> Erzeugte Dateien entfernen

TYPST     ?= typst
INPUT     ?= main.typ
OUTPUT    ?= thesis.pdf
FONT_PATH ?= fonts
WORTZAHL_LABEL ?= <word-count>

.PHONY: all build watch check wordcount clean docker

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
## Warnung – solche Zeilen werden herausgefiltert (POSIX-portabel: Status
## des typst-Aufrufs über $? direkt nach der Zuweisung; grep -v liefert
## bei vollständiger Filterung Status 1, deshalb || true).
check:
	@ausgabe="$$($(TYPST) compile --font-path $(FONT_PATH) $(INPUT) $(OUTPUT) 2>&1)"; \
	status=$$?; \
	gefiltert="$$(printf '%s\n' "$$ausgabe" | { grep -v '^downloading @preview/' | grep -v 'B /' || true; })"; \
	if [ -n "$$gefiltert" ]; then printf '%s\n' "$$gefiltert"; fi; \
	if [ $$status -ne 0 ] || [ -n "$$gefiltert" ]; then exit 1; fi
	@echo "✓ Kompiliert ohne Fehler und Warnungen"
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

## Reproduzierbarer Build im Docker-Container (ohne lokale Typst-Installation)
docker:
	docker build -t fom-typst-template .
	docker run --rm -v "$(CURDIR)":/arbeit fom-typst-template

clean:
	rm -f $(OUTPUT)
