// =============================================================================
// FOM Wissenschaftliche Arbeit – Haupteinstiegspunkt (Minimal-Variante)
// =============================================================================
// Kompilieren:  typst compile --font-path fonts main.typ thesis.pdf
// oder:         make build   |   Live-Vorschau: make watch
//
// Ausführliche Anleitung: Doku-Webseite im Branch `main` (/docs-app) bzw.
// vollständiges Beispiel im Branch `example-thesis`.

#import "template/fom.typ": *

#show: fom-arbeit.with(
  // --- Titelblatt (Leitfaden 2.1) --------------------------------------------
  titel: [Inwiefern sind Konzepte, die bei Cybersyn zur Verwaltung einer Wirtschaft angewendet wurden, auf moderne Monitoring- und Decision-Support-System-Kontexte übertragbar?],
  autor: "Levin Rüßmann",
  typ: "Seminararbeit", // "Master-Thesis", "Seminararbeit", "Hausarbeit"
  studiengang: "Bachelor of Science Informatik",
  erstgutachter: "Prof. Dr. Peter Vatter", // bei Seminararbeiten: Betreuer(in)
  matrikelnummer: "838791",
  abgabedatum: "31.8.2026", // Zeichenkette oder datetime(...)
  semester: "2", // nur Seminararbeit
  modul: "Wissenschaftliches Arbeiten", // nur Seminararbeit: "Seminararbeit in <modul>"
  hochschule: "FOM Hochschule für Oekonomie & Management",
  logo: image("./abbildungen/fom-logo.svg", width: 2.2cm), // z. B. image("abbildungen/logo.png", width: 3cm)

  // --- Formale Konfiguration --------------------------------------------------
  zitierweise: "chicago", // "chicago" (Fußnoten), "harvard" oder "apa" (im Text)
  schriftart: "Times New Roman", // "Arial" setzt automatisch 11,5 pt
  abkuerzungen: (
    "VSM": "Viable System Model",
    "CORFO": "Corporación de Fomento de la Producción",
    "ECOM": "Empresa Nacional de Computación e Informática",
    "CII": "Compagnie Internationale pour l'Informatique",
    "INTEC": "Instituto de Investigaciones Tecnológicas",
    "UP": "Unidad Popular",
    "USA": "Vereinigten Staaten von Amerika",
    "LKW": "Last Kraft Wagen",
  ),
  // symbole: ("m²": "Quadratmeter"),
  // sperrvermerk: (ort: "Essen", datum: "TT.MM.JJJJ"),
)

// --- Textteil -----------------------------------------------------------------
#include "content/01-einleitung.typ"
#include "content/02-grundlagen-der-management-kybernetik.typ"
#include "content/03-das-cybersyn-project.typ"
#include "content/04-moderne-monitoring-und-desision-support-systeme.typ"
#include "content/05-gegenuberstellung-und-erkennetnid-aus-dem-cybersyn-projekt.typ"
#include "content/06-zusammenfassung-und-ausblick.typ"

// --- Anhang (optional, Leitfaden 2.8) ------------------------------------------
// #anhang[
//   #anhang-abschnitt([Verwendeter Fragebogen])[...]
// ]

// --- Literaturverzeichnis (Leitfaden 2.6) --------------------------------------
#literaturverzeichnis(datei: "/literatur/literatur.bib")

// --- KI-Hilfsmittelverzeichnis (Leitfaden 2.9) ---------------------------------
#ki-hilfsmittelverzeichnis(
  (
    // (tool: "ChatGPT", version: "4o", nutzung: "…", teile: "Kapitel …"),
    (
      tool: "Claude Webseite",
      version: "Opus 4.8",
      nutzung: "Rechtschreibung: Groß- und Kleinschreibung sowie Punkt- und Kommasetzung",
      teile: "Gesamt",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 4.7",
      nutzung: "Suche von Quellen: Finden von Primärquellen wie Brain of the Firm von Stafford Beer",
      teile: "Kapitel 2",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 5",
      nutzung: "Zusammenfassung von Stafford Beers Brain of the Firm",
      teile: "Kapitel 2, 3",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 5",
      nutzung: "Zusammenfassung der Kapitel zum Operationsraum aus Stafford Beers Brain of the Firm",
      teile: "Kapitel 3",
    ),
    (
      tool: "Google Scholar Labs",
      version: "Genutzt am 18. Juli 2026",
      nutzung: "Suche von Quellen: Definition Decision-Support-Systeme und moderne Kybernetik-Definition",
      teile: "Kapitel 2",
    ),
    (
      tool: "Gemini",
      version: "Gemini 3.5 Flash",
      nutzung: "Korrektur von Rechtschreibung, Bewertung, ob Ausdrucksweise und Formulierung wissenschaftlich sind oder zu umgangssprachlich",
      teile: "Gesamt",
    ),
    (
      tool: "DeepL",
      version: "DeepL Translate",
      nutzung: "Übersetzung von unbekannten Wörtern aus Quellen",
      teile: "Gesamt",
    ),
    (
      tool: "Claude Code",
      version: "Opus 4.8",
      nutzung: "Korrektur der Rechtschreibung im KI-Hilfsmittelverzeichnis",
      teile: "Gesamt",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Korrektur von Rechtschreibung, Zeichensetzung und Groß- und Kleinschreibung; Einfügen von Querverweisen auf die Abbildung des Viable System Model",
      teile: "Kapitel 1, 2 und 3",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Überarbeitung der Drawio Datein so das sie einen einhaltlichen style haben. Sowie eine Legende.",
      teile: "Abbildung 1,2,3,4,5,7",
    ),
  ),
)

// --- Eigenständigkeitserklärung (Leitfaden 2.10, ohne Seitenzahl) --------------
#eigenstaendigkeitserklaerung(ort: "Unna", datum: "31.08.2026")
