import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";
import Tabs from "../komponenten/Tabs";

export default function Literatur() {
  return (
    <Seite
      leitfaden="Leitfaden 2.6 · Literaturverzeichnis"
      titel="Zotero & Mendeley anbinden"
      einleitung="Quellen sammelst du bequem in Zotero oder Mendeley. Ein automatischer Export in die Datei literatur/literatur.bib verbindet die Literaturverwaltung mit dem Template – danach genügt #vgl(<schluessel>) im Text."
    >
      <h2>So hängt alles zusammen</h2>
      <CodeBlock
        datei="Datenfluss"
        code={`Browser ── Zotero Connector / Mendeley Web Importer
              │  (Quelle mit einem Klick übernehmen)
              ▼
   Zotero / Mendeley  ── automatischer BibTeX-Export
              │
              ▼
   literatur/literatur.bib ──> #vgl(<schluessel>) ──> Fußnote + Literaturverzeichnis`}
      />

      <h2>Variante A: Zotero (empfohlen)</h2>
      <p>
        Zotero ist kostenlos, quelloffen – und mit dem Plugin{" "}
        <a href="https://retorque.re/zotero-better-bibtex/" target="_blank" rel="noreferrer">
          Better BibTeX
        </a>{" "}
        hält es deine <code>literatur.bib</code> vollautomatisch aktuell.
      </p>
      <ol>
        <li>
          <a href="https://www.zotero.org/download/" target="_blank" rel="noreferrer">
            Zotero
          </a>{" "}
          samt Browser-Connector installieren.
        </li>
        <li>
          Better BibTeX installieren: die <code>.xpi</code>-Datei von der Plugin-Seite laden, in
          Zotero unter <strong>Werkzeuge → Plugins → Zahnrad → Install Plugin From File…</strong>{" "}
          auswählen, Zotero neu starten.
        </li>
        <li>
          Deine Thesis-Sammlung rechtsklicken → <strong>„Sammlung exportieren…“</strong> →
          Format <strong>„Better BibTeX“</strong> → Haken bei{" "}
          <strong>„Keep updated“ (Automatischer Export)</strong> setzen.
        </li>
        <li>
          Als Ziel <code>literatur/literatur.bib</code> im Projektordner wählen (Vorhandenes
          überschreiben).
        </li>
      </ol>
      <Callout titel="Das war die ganze Einrichtung">
        <p>
          Ab jetzt schreibt Zotero jede neue oder geänderte Quelle selbstständig in die{" "}
          <code>literatur.bib</code>. Quelle im Browser anklicken, in Typst{" "}
          <code>#vgl(&lt;schluessel&gt;)</code> tippen, fertig. Den Schlüssel zeigt Better BibTeX
          in der Spalte „Citation Key“ (z. B. <code>theisen2021</code>).
        </p>
      </Callout>
      <h3>Stichwort für den Chicago-Kurzbeleg pflegen</h3>
      <p>
        Der FOM-Chicago-Stil verlangt ein <em>Stichwort</em> je Quelle („Mayer, D.,{" "}
        <em>Finanzinvestitionen</em>, 2019“). Trage es in Zotero im Feld{" "}
        <strong>„Kurztitel“</strong> ein – Better BibTeX exportiert es als{" "}
        <code>shorttitle</code>, und das Template nutzt es automatisch. Ohne Kurztitel erscheint
        der volle Titel.
      </p>

      <h2>Variante B: Mendeley</h2>
      <ol>
        <li>
          <a href="https://www.mendeley.com/download-reference-manager/" target="_blank" rel="noreferrer">
            Mendeley Reference Manager
          </a>{" "}
          und den Web Importer installieren.
        </li>
        <li>
          Quellen im Browser über den Web Importer sammeln; PDFs zieht Mendeley auf Wunsch
          gleich mit.
        </li>
        <li>
          Export: Sammlung markieren → <strong>File → Export All → BibTeX (*.bib)</strong> → als{" "}
          <code>literatur/literatur.bib</code> speichern.
        </li>
      </ol>
      <Callout art="achtung" titel="Mendeley exportiert nicht automatisch">
        <p>
          Anders als Zotero mit Better BibTeX aktualisiert Mendeley die Datei nicht von selbst –
          nach neuen Quellen den Export einfach wiederholen. Auch das Feld „Kurztitel“ fehlt im
          Mendeley-Export; das Stichwort kannst du bei Bedarf als{" "}
          <code>shorttitle = {"{...}"}</code> direkt in der <code>.bib</code>-Datei ergänzen.
        </p>
      </Callout>

      <h2>Die .bib-Datei verstehen</h2>
      <p>Ein Eintrag ist reiner Text – so sieht eine Monographie aus:</p>
      <CodeBlock
        datei="literatur/literatur.bib"
        code={`@book{theisen2021,
  author     = {Theisen, Manuel René},
  title      = {Wissenschaftliches Arbeiten – Erfolgreich bei
                Bachelor- und Masterarbeiten},
  shorttitle = {Wissenschaftliches Arbeiten},  % ← Stichwort (Chicago)
  edition    = {18},
  address    = {München},
  publisher  = {Vahlen},
  year       = {2021},
}`}
      />
      <p>Und eine Internetquelle – sie wandert automatisch ans Ende des Literaturverzeichnisses:</p>
      <CodeBlock
        datei="literatur/literatur.bib"
        code={`@online{destatis2024,
  author     = {{Statistisches Bundesamt}},   % doppelte Klammern: Institution
  title      = {Qualität der Arbeit: Arbeiten von Zuhause},
  shorttitle = {Homeoffice},
  url        = {https://www.destatis.de/...},
  date       = {2024-05-15},   % Datum der Version
  urldate    = {2026-07-01},   % dein Zugriffsdatum
}`}
      />

      <h2>Welche Felder wofür?</h2>
      <Tabs
        tabs={[
          {
            titel: "Monographie",
            inhalt: (
              <p className="text-sm">
                <code>author</code>, <code>title</code>, <code>shorttitle</code>,{" "}
                <code>edition</code> (nur ab 2. Auflage), <code>address</code>,{" "}
                <code>publisher</code>, <code>year</code> → „Scholz, Christian (Personal, 2014):
                Personalmanagement, 6. Aufl., München: Vahlen, 2014“
              </p>
            ),
          },
          {
            titel: "Sammelwerk-Aufsatz",
            inhalt: (
              <p className="text-sm">
                <code>@incollection</code> mit <code>author</code>, <code>title</code>,{" "}
                <code>editor</code>, <code>booktitle</code>, <code>year</code>,{" "}
                <code>pages</code> → „Schuler, Armin (Private Equity, 2012): Beratungs- und
                Finanzierungsgeschäfte, in: Hockmann, …, (Hrsg.), Investment Banking, 2012,
                S. 277–294“
              </p>
            ),
          },
          {
            titel: "Zeitschriftenartikel",
            inhalt: (
              <p className="text-sm">
                <code>@article</code> mit <code>journal</code>, <code>volume</code>,{" "}
                <code>number</code>, <code>pages</code> → „Akerlof, George A. (Lemons, 1970): The
                Market for “Lemons” …, in: Q J Econ, 84 (1970), Nr. 3, S. 488–500“
              </p>
            ),
          },
          {
            titel: "Internetquelle",
            inhalt: (
              <p className="text-sm">
                <code>@online</code> mit <code>url</code>, <code>date</code> (Versionsdatum) und{" "}
                <code>urldate</code> (Zugriff) → „…, &lt;https://…&gt; (2024-05-15) [Zugriff
                2026-07-01]“. Leitfaden-Tipp: Internetquellen sparsam zitieren und als
                PDF/Screenshot sichern.
              </p>
            ),
          },
        ]}
      />

      <Callout titel="Nur zitierte Quellen erscheinen">
        <p>
          Das Literaturverzeichnis enthält automatisch genau die Werke, die im Text belegt
          wurden – nicht zitierte Literatur bleibt draußen, wie es der Leitfaden verlangt. Die{" "}
          <code>.bib</code>-Datei darf also ruhig deine ganze Sammlung enthalten.
        </p>
      </Callout>
    </Seite>
  );
}
