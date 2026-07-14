# FOM-Typst-Template

**Wissenschaftliche Arbeiten nach dem FOM-Leitfaden – ohne Formatierungsstress.**

Dieses Template setzt den *Leitfaden zur formalen Gestaltung von Seminar- und
Abschlussarbeiten* der FOM Hochschule (Stand Januar 2024) mit
[Typst](https://typst.app) um – einem modernen, schnellen Satzsystem. Seitenränder,
Zitierweise, sämtliche Verzeichnisse und die seit 2024 verpflichtenden KI-Nachweise
sind vorkonfiguriert: Du schreibst nur noch.

> ⚠️ Community-Projekt, kein offizielles Angebot der FOM Hochschule. Verbindlich ist
> immer der Leitfaden bzw. die Absprache mit dem Erstgutachter.

## ✨ Funktionen

| | |
|---|---|
| 📐 **Layout nach Leitfaden 1.2** | DIN A4, Ränder 4/2/4/2 cm, Times New Roman 12 pt (bzw. Arial 11,5 pt), 1,5-zeilig, Blocksatz, Silbentrennung, Fußnoten 10 pt einzeilig |
| 🔢 **Seitennummerierung** | Titelblatt gezählt ohne Nummer, Verzeichnisse römisch ab II, Textteil arabisch ab 1, Eigenständigkeitserklärung ohne Nummer |
| 📚 **Zitieren per Funktion** | `#vgl(<quelle>, seite: "12")` → „Vgl. Mayer, D., Finanzinvestitionen, 2019, S. 12.“ – wahlweise **Chicago** (Fußnoten mit Stichwort) oder **Harvard** (im Text), umschaltbar mit einer Zeile |
| 🗂 **Alle Verzeichnisse automatisch** | Inhalts-, Abbildungs-, Tabellen-, Formel-, Symbol- und Abkürzungsverzeichnis (nur tatsächlich verwendete Abkürzungen) |
| 🤖 **KI-Deklaration (Leitfaden 1.6/2.9)** | `#ki-nachweis(...)` für lokale Nachweise + fertiges KI-Hilfsmittelverzeichnis |
| 🔗 **Zotero & Mendeley** | BibTeX-Export in `literatur/literatur.bib` – mit Better BibTeX vollautomatisch; eigene CSL-Stile im exakten FOM-Format |
| 🛠 **Cross-Platform-Builds** | Makefile, Bash-/PowerShell-Skripte, Docker, Dev-Container, GitHub Actions (PDF als Artefakt bei jedem Push) |
| 📖 **Moderne Dokumentation** | [fom-typst.levin-dev.de](https://fom-typst.levin-dev.de) – Schritt-für-Schritt-Anleitungen für Windows, macOS und Linux (Quellcode in [`/docs-app`](docs-app)) |

## 🚀 Schnellstart

```bash
# 1. Typst installieren
brew install typst                     # macOS
winget install --id Typst.Typst        # Windows
# Linux: https://github.com/typst/typst/releases

# 2. Template holen (oder auf GitHub: "Use this template")
git clone -b template https://github.com/LevinTheDoctor/fom-typst-template.git meine-thesis
cd meine-thesis

# 3. Kompilieren
make build          # oder: typst compile --font-path fonts main.typ thesis.pdf
make watch          # Live-Vorschau beim Schreiben
```

Danach in [`main.typ`](main.typ) Titel, Name, Studiengang und Zitierweise eintragen
und in [`content/`](content) losschreiben. Die vollständige Anleitung liefert die
**Dokumentations-Webseite**: [fom-typst.levin-dev.de](https://fom-typst.levin-dev.de)
(lokal startbar mit `make docs-dev`).

## 📁 Projektstruktur

```
├── main.typ                  # Einstiegspunkt: alle Angaben zur Arbeit
├── content/                  # deine Kapitel (eine Datei pro Kapitel)
├── literatur/literatur.bib   # Literatur aus Zotero/Mendeley
├── abbildungen/              # eigene Bilder
├── template/
│   ├── fom.typ               # Haupt-Template (fom-arbeit)
│   ├── styles.typ            # zentrale Layout-Konstanten
│   ├── komponenten/          # Titelblatt, Verzeichnisse, Zitieren, KI, …
│   └── csl/                  # FOM-Zitierstile (Chicago & Harvard)
├── fonts/                    # Liberation Serif (Fallback, SIL OFL)
├── docs-app/                 # Dokumentations-Webseite (Vite + React)
├── scripts/                  # build.sh / build.ps1
└── Makefile · Dockerfile · .devcontainer/ · .github/workflows/
```

## 🌿 Branches

| Branch | Zweck |
|---|---|
| **`main`** | Basis-Template mit kompakten Beispielkapiteln, die jede Funktion einmal zeigen – empfohlener Startpunkt |
| **`template`** | Wie `main`, aber ohne die Doku-Webseite (`docs-app/`) – zum schlanken Klonen fürs eigene Schreiben |
| **`example-thesis`** | Vollständig ausgefüllte Musterarbeit zum Nachschlagen |
| **`minimal`** | Leeres Grundgerüst ohne Beispieltexte und Doku-Webseite |

```bash
git clone -b template https://github.com/LevinTheDoctor/fom-typst-template.git meine-arbeit
# oder in einem bestehenden Klon: git switch template (bzw. example-thesis, minimal)
```

## 🧪 Qualitätssicherung

* `make check` kompiliert streng: **Warnungen gelten als Fehler**.
* Die GitHub Action [`pdf-bauen.yml`](.github/workflows/pdf-bauen.yml) baut bei jedem
  Push und hängt das PDF als Artefakt an – ideal, um Zwischenstände mit der Betreuung
  zu teilen.
* Bekannte (unkritische) Abweichungen vom Leitfaden sind transparent in der
  Doku-Webseite unter [„FAQ & bekannte
  Abweichungen“](https://fom-typst.levin-dev.de/#/faq) dokumentiert.

## 🤝 Mitwirken

Fehler gefunden, Leitfaden-Update entdeckt oder eine Verbesserungsidee? Issues und
Pull Requests sind ausdrücklich willkommen – siehe
[CONTRIBUTING.md](.github/CONTRIBUTING.md).

## 📄 Lizenz

[MIT](LICENSE) – frei verwendbar für Studium, Lehre und eigene Vorlagen.
Die Schriften im Ordner [`fonts/`](fonts) stehen unter der
[SIL Open Font License](fonts/LICENSE). Das FOM-Logo
([`abbildungen/fom-logo.svg`](abbildungen/fom-logo.svg)) ist markenrechtlich
geschützt, nicht Teil der MIT-Lizenz und nur für Arbeiten an der FOM bestimmt.
