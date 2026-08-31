TYPST     ?= typst
INPUT     ?= main.typ
OUTPUT    ?= thesis.pdf
FONT_PATH ?= fonts
WORTZAHL_LABEL ?= <word-count>

.PHONY: all build watch check clean docker wordcount

all: build

## PDF erzeugen
build:
	$(TYPST) compile --font-path $(FONT_PATH) $(INPUT) $(OUTPUT)
	@echo "✓ $(OUTPUT) erzeugt"
	@$(MAKE) --no-print-directory wordcount

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
	@$(MAKE) --no-print-directory wordcount

## Wortzahl aus dem Dokument auslesen und ausgeben (eigenständiges Target,
## damit build und check dieselbe Logik nutzen statt sie zu duplizieren)
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