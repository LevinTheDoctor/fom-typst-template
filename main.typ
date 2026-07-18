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
  titel: [Inwieferen sind Konzepte die bei dem Cybersyn zu verwaltung einer wirtschaft angewendet
    wurde in moderne Monitoring- und Decision-Support-Systeme kontexten
    übertragbar.],
  autor: "Levin Rüßmann",
  typ: "Seminararbeit", // "Master-Thesis", "Seminararbeit", "Hausarbeit"
  studiengang: "Informatik",
  erstgutachter: "Prof. Dr. Peter Vatter", // bei Seminararbeiten: Betreuer(in)
  matrikelnummer: "838791",
  abgabedatum: "31.8.2026", // Zeichenkette oder datetime(...)
  semester: "2", // nur Seminararbeit
  modul: "Wissenschaftliches Arbeiten", // nur Seminararbeit: "Seminararbeit in <modul>"
  hochschule: "FOM Hochschule für Oekonomie & Management",
  logo: image("./abbildungen/fom-logo.svg", width: 2.2cm), // z. B. image("abbildungen/logo.png", width: 3cm)

  // --- Formale Konfiguration --------------------------------------------------
  zitierweise: "chicago", // "chicago" (Fußnoten) oder "harvard" (im Text)
  schriftart: "Arial", // "Arial" setzt automatisch 11,5 pt
  abkuerzungen: (
    // "HRM": "Human Resource Management",
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
      nutzung: "Rechtschreibung: Groß und Kleinschreibung, sowie Punkt und Kommasetzung",
      teile: "Gesamt",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 4.7",
      nutzung: "Suche von Quellen: Finden von Primär Quellen wie Brain of the Firm von Strafford Beer",
      teile: "Kapitel 2",
    ),
    (
      tool: "Goolge Scholar Labs",
      version: "Genutzt am 18.Juli.2027",
      nutzung: "Suche von Quellen: Definntion Descion Support Systeme und moderen Kybernetik Defention",
      teile: "Kapitel 2",
    ),
    (
      tool: "Gemini",
      version: "Gemini 3.5 Flash",
      nutzung: "Korrektur von Rechtschreibung, Bewertung ob die Ausdrucksweise formlirung Wissenschaftlich sind oder zu Umgangsprachlich",
      teile: "Gesamt",
    ),
    (
      tool: "Deepl",
      version: "Deepl Translate",
      nutzung: "Über Setzung von unbekannten Wörte von Qullen.",
      teile: "Gesamt",
    ),
  ),
)

// --- Eigenständigkeitserklärung (Leitfaden 2.10, ohne Seitenzahl) --------------
#eigenstaendigkeitserklaerung(ort: "Ort", datum: "TT.MM.JJJJ")
