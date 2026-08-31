// =============================================================================
// FOM Wissenschaftliche Arbeit – Haupteinstiegspunkt (Minimal-Variante)
// =============================================================================
// Kompilieren:  typst compile --font-path fonts main.typ thesis.pdf
// oder:         make build   |   Live-Vorschau: make watch
//
// Ausführliche Anleitung: Doku-Webseite im Branch `main` (/docs-app) bzw.
// vollständiges Beispiel im Branch `example-thesis`.

#import "template/fom.typ": *
#import "@preview/wordometer:0.1.5": total-words, word-count



#show: fom-arbeit.with(
  // --- Titelblatt (Leitfaden 2.1) --------------------------------------------
  titel: [Inwiefern sind Konzepte, die bei Cybersyn zur Verwaltung einer Wirtschaft angewendet wurden, auf moderne Monitoring- und Decision-Support-System-Kontexte übertragbar?],
  autor: "Levin Rüßmann",
  typ: "Seminararbeit", // "Master-Thesis", "Seminararbeit", "Hausarbeit"
  studiengang: "Informatik",
  grad: "Bachelor of Science (B.Sc.)",
  erstgutachter: "Prof. Dr. Peter Vatter", // bei Seminararbeiten: Betreuer(in)
  matrikelnummer: "838791",
  abgabedatum: "31.08.2026", // Zeichenkette oder datetime(...)
  wortanzahl: auto, // Wortzahl des Textteils aus der Marke <word-count> unten
  modul: "Wissenschaftliches Arbeiten", // nur Seminararbeit: "Seminararbeit in <modul>"
  hochschule: "FOM Hochschule für Oekonomie & Management",
  logo: image("./abbildungen/fom-logo.svg", width: 2.2cm), // z. B. image("abbildungen/logo.png", width: 3cm)
  studienzentrum: "Hochschulzentrum Dortmund",
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
    "CHECO": "CHilean ECOnomy",
    "DSS": "Decision-Support-System",
    "MS": "Monitoring-System",
    "K8s": "Kubernetes",
    "KPI": "Key Performance Indicator",
    "AWS": "Amazon Web Services",
    "GCP": "Google Cloud Platform",
  ),
  // symbole: ("m²": "Quadratmeter"),
  // sperrvermerk: (ort: "Essen", datum: "TT.MM.JJJJ"),
)

// --- Textteil -----------------------------------------------------------------
#word-count(
  total => [
    #include "content/01-einleitung.typ"
    #include "content/02-grundlagen-der-management-kybernetik.typ"
    #include "content/03-das-cybersyn-project.typ"
    #include "content/04-moderne-monitoring-und-desision-support-systeme.typ"
    #include "content/05-gegenuberstellung-und-erkennetnid-aus-dem-cybersyn-projekt.typ"
    #include "content/06-zusammenfassung-und-ausblick.typ"

    #metadata(total.words) <word-count>
  ],
  // Gezählt wird nur der Fließtext: Fußnoten sowie Abbildungen und Tabellen
  // (Titel, Inhalt und Quellenzeile) bleiben außen vor.
  exclude: (footnote, figure, table),
)

// --- Anhang (optional, Leitfaden 2.8) ------------------------------------------
// #anhang[
//   #anhang-abschnitt([Verwendeter Fragebogen])[...]
// ]

// --- Literaturverzeichnis (Leitfaden 2.6) --------------------------------------
#literaturverzeichnis(
  datei: "/literatur/literatur.bib",
  internetquellen: "/literatur/internetquellen.bib",
  // Herausgeberbände zu den zitierten Sammelwerkbeiträgen: im Text nicht belegt,
  // gehören aber ins Verzeichnis.
  zusaetzlich: (<wernerCyberneticsStateArt2017>, <beyerSiteReliabilityEngineering2016>),
)

// --- KI-Hilfsmittelverzeichnis (Leitfaden 2.9) ---------------------------------
#ki-hilfsmittelverzeichnis(
  (
    // (tool: "ChatGPT", version: "4o", nutzung: "…", teile: "Kapitel …", datum: "TT.MM.JJJJ"),
    (
      tool: "Claude Webseite",
      version: "Opus 4.8",
      nutzung: "Rechtschreibung: Groß- und Kleinschreibung sowie Punkt- und Kommasetzung",
      teile: "Gesamt",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 4.7",
      nutzung: "Suche von Quellen: Finden von Primärquellen wie Brain of the Firm von Stafford Beer",
      teile: "Kapitel 2",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 5",
      nutzung: "Zusammenfassung von Stafford Beers Brain of the Firm",
      teile: "Kapitel 2, 3",
      datum: "TT.MM.JJJJ",
    ),

    (
      tool: "DeepL",
      version: "DeepL Translate",
      nutzung: "Übersetzung von unbekannten Wörtern aus Quellen",
      teile: "Gesamt",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Opus 4.8",
      nutzung: "Korrektur der Rechtschreibung im KI-Hilfsmittelverzeichnis",
      teile: "KI-Hilfsmittelverzeichnis",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Korrektur von Rechtschreibung, Zeichensetzung und Groß- und Kleinschreibung.",
      teile: "Gesamt",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Überarbeitung der draw.io-Dateien, sodass sie einen einheitlichen Stil und eine Legende haben.",
      teile: "Abbildungen 2–6",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Imports aus Better BibTeX ordentlicher aufteilen, sodass zwischen Büchern, Artikeln und Onlinequellen unterschieden wird. So ist das Literaturverzeichnis sauber aufgebaut.",
      teile: "BibTeX / Literaturverzeichnis",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Webseite",
      version: "Opus 5",
      nutzung: "Kompilierte PDF bewerten und nach Fehlern suchen, z. B. in der Zitation.",
      teile: "Gesamt",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Behebung einer Liste konkret benannter Rechtschreib-, Zeichensetzungs- und Ausdrucksfehler (u. a. Durchkopplungen, Groß-/Kleinschreibung, gebrochene Satzkonstruktion in Kapitel 5.2, doppelte Leerzeichen vor Fußnotenziffern, verschachtelte Fußnote in Kapitel 2 aufgelöst) sowie Korrektur der Beschriftungen in den draw.io-Abbildungen 2 und 5 und eines Bibliographie-Eintrags.",
      teile: "Gesamt, Abbildungen 2 und 5, Literaturverzeichnis",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Opus 5",
      nutzung: "Neugestaltung des Titelblatts der Seminararbeit und automatische Übernahme der Wortanzahl aus dem Textteil",
      teile: "Titelblatt",
      datum: "TT.MM.JJJJ",
    ),
    (
      tool: "Claude Code",
      version: "Sonnet 5",
      nutzung: "Behebung einer Liste konkret benannter Fehler in Fußnoten (Groß-/Kleinschreibung, Durchkopplung „Management-Kybernetik“, Kasusfehler, Komma-Splices, Namensschreibung „Norbert Wiener“, fehlende „Vgl.“ und Schlusspunkte, unklare Formulierungen, angeglichene Wortwahl „größte Errungenschaft“).",
      teile: "Kapitel 2 und 3",
      datum: "TT.MM.JJJJ",
    ),
  ),
)

// --- Eigenständigkeitserklärung (Leitfaden 2.10, ohne Seitenzahl) --------------
#eigenstaendigkeitserklaerung(ort: "Unna", datum: "31.08.2026")
