import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Schnellstart() {
  return (
    <Seite
      leitfaden="Schritt 2 von 3"
      titel="Schnellstart"
      einleitung="In fünf Minuten von der Vorlage zur eigenen Arbeit: Angaben eintragen, Kapitel schreiben, kompilieren."
    >
      <h2>Projektstruktur</h2>
      <CodeBlock
        datei="Ordnerübersicht"
        code={`meine-thesis/
├── main.typ              ← HIER trägst du deine Angaben ein
├── content/              ← deine Kapitel (eine Datei pro Kapitel)
│   ├── 01-einleitung.typ
│   ├── 02-grundlagen.typ
│   └── ...
├── literatur/
│   └── literatur.bib     ← Literatur aus Zotero/Mendeley
├── abbildungen/          ← eigene Bilder (PNG, JPG, SVG)
├── template/             ← das FOM-Template (musst du nicht anfassen)
└── fonts/                ← Liberation Serif als Fallback-Schrift`}
      />

      <h2>1. Angaben zur Arbeit eintragen</h2>
      <p>
        Alles Formale steht zentral in <code>main.typ</code>:
      </p>
      <CodeBlock
        datei="main.typ"
        code={`#show: fom-arbeit.with(
  titel: [Analyse der Einflussfaktoren einer Steigerung
          der Mitarbeiterzufriedenheit im Homeoffice],
  autor: "Max Mustermann",
  typ: "Bachelor-Thesis",       // auch: "Master-Thesis", "Seminararbeit"
  studiengang: "Business Administration",
  grad: "Bachelor of Arts (B.A.)",
  erstgutachter: "Prof. Dr. Erika Musterfrau",
  matrikelnummer: "123456",
  abgabedatum: "25.01.2027",

  zitierweise: "chicago",       // oder "harvard"
  abkuerzungen: (
    "HRM": "Human Resource Management",
  ),
)`}
      />
      <Callout titel="Seminararbeit statt Thesis?">
        <p>
          <code>typ: "Seminararbeit"</code> setzen und zusätzlich{" "}
          <code>semester: "3"</code> sowie <code>modul: "Wissenschaftliches Arbeiten"</code>{" "}
          angeben – das Titelblatt wechselt automatisch auf das Muster aus Anhang 3 des
          Leitfadens.
        </p>
      </Callout>

      <h2>2. Kapitel schreiben</h2>
      <p>
        Jedes Kapitel ist eine Datei in <code>content/</code>. Überschriften erzeugen die
        dekadische Gliederung (1, 1.1, 1.2 …) automatisch:
      </p>
      <CodeBlock
        datei="content/01-einleitung.typ"
        code={`#import "../template/fom.typ": *

= Einleitung

== Problemstellung

Hier beginnt dein Text. Ein indirektes Zitat belegst du
so.#vgl(<theisen2021>, seite: "136")

== Zielsetzung und Gang der Arbeit

Abkürzungen wie #abk("HRM") werden beim ersten Auftreten
automatisch ausgeschrieben.`}
      />
      <p>
        Neue Kapiteldateien in <code>main.typ</code> mit{" "}
        <code>#include "content/05-mein-kapitel.typ"</code> einbinden.
      </p>

      <h2>3. Kompilieren</h2>
      <CodeBlock
        datei="Terminal"
        code={`# einmalig bauen
make build

# oder: Live-Vorschau – kompiliert bei jedem Speichern neu
make watch`}
      />
      <p>
        Ohne <code>make</code> (z. B. unter Windows):
      </p>
      <CodeBlock
        datei="PowerShell"
        code={`.\\scripts\\build.ps1          # einmalig
.\\scripts\\build.ps1 -Watch   # Live-Vorschau`}
      />

      <h2>Was automatisch passiert</h2>
      <ul>
        <li>
          <strong>Titelblatt</strong> nach Anhang 3/4 des Leitfadens, gezählt als Seite I (ohne
          sichtbare Nummer).
        </li>
        <li>
          <strong>Inhaltsverzeichnis</strong> ab Seite II (römisch), Textteil ab Seite 1
          (arabisch) – Leitfaden 1.2 Nr. 10.
        </li>
        <li>
          <strong>Abbildungs-, Tabellen-, Formel- und Abkürzungsverzeichnis</strong> erscheinen
          nur, wenn es entsprechende Inhalte gibt.
        </li>
        <li>
          <strong>Literaturverzeichnis</strong> im FOM-Format inklusive ans Ende sortierter
          Internetquellen.
        </li>
        <li>
          <strong>Blocksatz, Silbentrennung, 1,5-zeiliger Abstand, Fußnoten in 10 pt</strong> –
          alles nach Leitfaden 1.2.
        </li>
      </ul>

      <h2>Optionale Bausteine</h2>
      <CodeBlock
        datei="main.typ"
        code={`// Sperrvermerk bei unternehmensinternen Daten (Leitfaden 1.3):
sperrvermerk: (ort: "Essen", datum: "25.01.2027"),

// Formel- und Symbolverzeichnis (Leitfaden 2.5):
symbole: ("m²": "Quadratmeter"),

// Arial statt Times New Roman (11,5 pt wird automatisch gesetzt):
schriftart: "Arial",`}
      />
    </Seite>
  );
}
