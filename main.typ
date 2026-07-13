// =============================================================================
// FOM Wissenschaftliche Arbeit – Haupteinstiegspunkt
// =============================================================================
// Kompilieren:  typst compile main.typ thesis.pdf   (oder: make build)
// Live-Vorschau: typst watch main.typ thesis.pdf    (oder: make watch)
//
// Alle formalen Einstellungen werden hier zentral konfiguriert. Die Inhalte
// liegen als Kapitel im Ordner /content, die Literatur in /literatur.

#import "template/fom.typ": *

#show: fom-arbeit.with(
  // --- Titelblatt (Leitfaden 2.1) --------------------------------------------
  titel: [Analyse der Einflussfaktoren einer Steigerung der Mitarbeiterzufriedenheit im Homeoffice],
  autor: "Max Mustermann",
  typ: "Bachelor-Thesis", // "Master-Thesis", "Seminararbeit", "Hausarbeit"
  studiengang: "Business Administration",
  grad: "Bachelor of Arts (B.A.)",
  erstgutachter: "Prof. Dr. Erika Musterfrau",
  matrikelnummer: "123456",
  abgabedatum: "25.01.2027",
  // Für Seminararbeiten zusätzlich:
  // semester: "3",
  // modul: "Wissenschaftliches Arbeiten",
  //
  // Eigenes Logo (das FOM-Logo ist geschützt und wird nicht mitgeliefert):
  // logo: image("abbildungen/logo.png", width: 3.5cm),

  // --- Formale Konfiguration --------------------------------------------------
  zitierweise: "chicago", // "chicago" (Fußnoten) oder "harvard" (im Text)
  schriftart: "Times New Roman", // "Arial" setzt automatisch 11,5 pt
  seitenzahl-position: "mitte", // "mitte" oder "rechts"

  // Abkürzungen: im Text mit #abk("HRM") verwenden – das
  // Abkürzungsverzeichnis entsteht automatisch (nur verwendete Einträge).
  abkuerzungen: (
    "HRM": "Human Resource Management",
    "IKT": "Informations- und Kommunikationstechnik",
  ),

  // Formel- und Symbolverzeichnis (optional, Leitfaden 2.5):
  // symbole: ("m²": "Quadratmeter"),

  // Sperrvermerk (optional, Leitfaden 1.3):
  // sperrvermerk: (ort: "Essen", datum: "25.01.2027"),
)

// --- Textteil -----------------------------------------------------------------
#include "content/01-einleitung.typ"
#include "content/02-grundlagen.typ"
#include "content/03-methodik.typ"
#include "content/04-analyse.typ"
#include "content/05-fazit.typ"

// --- Anhang (optional, Leitfaden 2.8) ------------------------------------------
#anhang[
  #anhang-abschnitt([Kategoriensystem der Literaturanalyse])[
    Das Kategoriensystem wurde deduktiv aus dem theoretischen Bezugsrahmen
    abgeleitet und induktiv am Material verfeinert. Hauptkategorien:
    Autonomie, soziale Einbindung, technische Ausstattung, Entgrenzung.
  ]
  #anhang-abschnitt([Übersicht der ausgewerteten Quellen])[
    Alle Abbildungen, Tabellen und Formeln im Anhang werden wie im Textteil
    beschriftet und mit Quellen belegt.
  ]
]

// --- Literaturverzeichnis (Leitfaden 2.6) --------------------------------------
#literaturverzeichnis(datei: "/literatur/literatur.bib")

// --- KI-Hilfsmittelverzeichnis (Leitfaden 2.9) ---------------------------------
#ki-hilfsmittelverzeichnis((
  (
    tool: "ChatGPT",
    version: "4o",
    nutzung: "Paraphrasierung einzelner Textpassagen",
    teile: "Kapitel 3.2",
  ),
  (
    tool: "DeepL Write",
    version: "–",
    nutzung: "Sprachliche Überarbeitung",
    teile: "Gesamtes Dokument",
  ),
))

// --- Eigenständigkeitserklärung (Leitfaden 2.10, ohne Seitenzahl) --------------
#eigenstaendigkeitserklaerung(ort: "Essen", datum: "25.01.2027")
