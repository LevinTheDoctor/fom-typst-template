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
  titel: [Titel der Arbeit],
  autor: "Vorname Nachname",
  typ: "Bachelor-Thesis", // "Master-Thesis", "Seminararbeit", "Hausarbeit"
  studiengang: "Business Administration",
  grad: "Bachelor of Arts (B.A.)",
  erstgutachter: "Prof. Dr. …",
  matrikelnummer: "000000",
  abgabedatum: "TT.MM.JJJJ",
  // Für Seminararbeiten zusätzlich:
  // semester: "3",
  // modul: "Wissenschaftliches Arbeiten",

  // --- Formale Konfiguration --------------------------------------------------
  zitierweise: "chicago", // "chicago" (Fußnoten) oder "harvard" (im Text)
  schriftart: "Times New Roman", // "Arial" setzt automatisch 11,5 pt
  abkuerzungen: (
    // "HRM": "Human Resource Management",
  ),
  // symbole: ("m²": "Quadratmeter"),
  // sperrvermerk: (ort: "Essen", datum: "TT.MM.JJJJ"),
)

// --- Textteil -----------------------------------------------------------------
#include "content/01-einleitung.typ"
#include "content/02-hauptteil.typ"

// --- Anhang (optional, Leitfaden 2.8) ------------------------------------------
// #anhang[
//   #anhang-abschnitt([Verwendeter Fragebogen])[...]
// ]

// --- Literaturverzeichnis (Leitfaden 2.6) --------------------------------------
#literaturverzeichnis(datei: "/literatur/literatur.bib")

// --- KI-Hilfsmittelverzeichnis (Leitfaden 2.9) ---------------------------------
#ki-hilfsmittelverzeichnis((
  // (tool: "ChatGPT", version: "4o", nutzung: "…", teile: "Kapitel …"),
))

// --- Eigenständigkeitserklärung (Leitfaden 2.10, ohne Seitenzahl) --------------
#eigenstaendigkeitserklaerung(ort: "Ort", datum: "TT.MM.JJJJ")
