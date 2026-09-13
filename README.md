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
| 📚 **Zitieren per Funktion** | `#vgl(<quelle>, seite: "12")` → „Vgl. Mayer, D., Finanzinvestitionen, 2019, S. 12.“ – **Chicago** (Fußnoten mit Stichwort), **Harvard** (im Text) oder **APA 7** (Zusatz), umschaltbar mit einer Zeile; inkl. `ebd.`-Automatik, Sekundärzitaten (`#vgl-nach`), Kapitelbelegen für E-Books (`#vgl-kap`) und getrennten Internetquellen |
| 🔢 **Wortzählung** | Wortzahl des Textteils automatisch auf dem Titelblatt („Wortanzahl: …“), bei jedem Build in der Konsole und in der CI-Übersicht – Fußnoten, Abbildungen und Tabellen bleiben außen vor |
| 🗂 **Alle Verzeichnisse automatisch** | Inhalts-, Abbildungs-, Tabellen-, Formel-, Symbol- und Abkürzungsverzeichnis (nur tatsächlich verwendete Abkürzungen) |
| 🤖 **KI-Deklaration (Leitfaden 1.6/2.9)** | `#ki-nachweis(...)` für lokale Nachweise + fertiges KI-Hilfsmittelverzeichnis inkl. Datum der Kommunikation |
| 🔗 **Zotero & Mendeley** | BibTeX-Export in `literatur/literatur.bib` – mit Better BibTeX vollautomatisch; eigene CSL-Stile im exakten FOM-Format |
| 🛠 **Cross-Platform-Builds** | Makefile, Bash-/PowerShell-Skripte, Docker, Dev-Container, GitHub Actions (legt das fertige `thesis.pdf` bei jedem Push direkt im Repository ab) |
| 📖 **Moderne Dokumentation** | [fom-typst.levin-dev.de](https://fom-typst.levin-dev.de) – Schritt-für-Schritt-Anleitungen für Windows, macOS und Linux (Quellcode in [`/docs-app`](docs-app)) |

## 🚀 Schnellstart

```bash
# 1. Typst installieren
brew install typst                     # macOS
winget install --id Typst.Typst        # Windows
# Linux: https://github.com/typst/typst/releases

# 2. Template holen (oder auf GitHub: "Use this template")
#    Der Standard-Branch ist `main`: ein leeres Grundgerüst zum Losschreiben.
git clone https://github.com/LevinTheDoctor/fom-typst-template.git meine-thesis
cd meine-thesis
# Lieber mit Beispielkapiteln starten? git clone -b webapp …

# 3. Kompilieren (gibt die Wortzahl des Textteils mit aus)
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
| **`main`** | Leeres Grundgerüst ohne Beispieltexte und Doku-Webseite – **Standard-Branch**, direkt losschreiben |
| **`webapp`** | Basis-Template mit kompakten Beispielkapiteln, die jede Funktion einmal zeigen, plus dem Quellcode der Doku-Webseite (`docs-app/`) – hier findet die Entwicklung statt |
| **`example-seminararbeit`** | Vollständig ausgefüllte, abgegebene Seminararbeit („Project Cybersyn“) als Praxisbeispiel: zeigt ebd.-Automatik, Sekundörzitate, getrennte Internetquellen, Wortzählung im Einsatz |

```bash
git clone https://github.com/LevinTheDoctor/fom-typst-template.git meine-arbeit   # liefert main
# oder in einem bestehenden Klon: git switch webapp (bzw. example-seminararbeit)
```

## 🧪 Qualitätssicherung

* `make check` kompiliert streng: **Warnungen gelten als Fehler**.
* Die GitHub Action [`pdf-bauen.yml`](.github/workflows/pdf-bauen.yml) baut bei jedem
  Push, committet das fertige `thesis.pdf` direkt in den Branch, hängt es
  zusätzlich als Artefakt an und schreibt die **Wortzahl des Textteils** in die
  Lauf-Übersicht – ideal, um Zwischenstände mit der Betreuung zu teilen.
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
