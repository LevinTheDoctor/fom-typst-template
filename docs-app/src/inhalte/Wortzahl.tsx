import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Wortzahl() {
  return (
    <Seite
      leitfaden="Leitfaden 1.2 Nr. 10 · Umfang"
      titel="Wortzahl & Umfang"
      einleitung="Seminararbeiten werden nach Wortzahl begrenzt (laut Modulbeschreibung, z. B. 4.000 Wörter) – gezählt wird der Textteil ohne Verzeichnisse, Anhang, Abbildungen und Tabellen. Das Template zählt diese Wörter automatisch: auf dem Titelblatt, bei jedem Build und in der CI."
    >
      <h2>Wortzählung aktivieren</h2>
      <p>
        Das Template nutzt das Typst-Paket{" "}
        <a
          href="https://typst.app/universe/package/wordometer"
          target="_blank"
          rel="noreferrer"
        >
          wordometer
        </a>
        . In <code>main.typ</code> werden die Kapitel von <code>#word-count(…)</code> umschlossen;
        das Ergebnis legt die Metadaten-Marke <code>&lt;word-count&gt;</code> ab:
      </p>
      <CodeBlock
        datei="main.typ"
        code={`#import "template/fom.typ": *
#import "@preview/wordometer:0.1.5": total-words, word-count

// …

#word-count(
  total => [
    #include "content/01-einleitung.typ"
    #include "content/02-hauptteil.typ"
    // … weitere Kapitel

    #metadata(total.words) <word-count>
  ],
  exclude: (footnote, figure, table),
)`}
      />
      <p>
        Das <code>exclude</code>-Argument sorgt dafür, dass nur der Fließtext zählt:{" "}
        <strong>Fußnoten</strong> sowie <strong>Abbildungen und Tabellen</strong> (Titel, Inhalt
        und Quellenzeile) bleiben außen vor – genau wie es der Leitfaden für den Umfang
        vorsieht.
      </p>

      <h2>Wortanzahl auf dem Titelblatt</h2>
      <p>
        Das Seminararbeit-Titelblatt kann die Wortanzahl automatisch anzeigen. Der Parameter{" "}
        <code>wortanzahl: auto</code> liest die Marke <code>&lt;word-count&gt;</code> – die Zeile
        „Wortanzahl: …“ erscheint dann im Datenblock unten:
      </p>
      <CodeBlock
        datei="main.typ"
        code={`#show: fom-arbeit.with(
  typ: "Seminararbeit",
  wortanzahl: auto,   // aus der Marke <word-count> lesen
  // wortanzahl: none, // Zeile ganz weglassen
  // wortanzahl: 2181, // feste Angabe
  // …
)`}
      />
      <Callout art="achtung" titel="Reihenfolge beachten">
        <p>
          Die Marke <code>&lt;word-count&gt;</code> steht am <em>Ende des Textteils</em>, das
          Titelblatt am Anfang – das funktioniert trotzdem, weil Typst das Dokument in mehreren
          Durchläufen auflöst. Nur wenn gar keine Marke existiert (kein{" "}
          <code>#word-count</code> eingebunden), entfällt die Zeile automatisch.
        </p>
      </Callout>

      <h2>Wortzahl beim Build und in der CI</h2>
      <p>
        <code>make build</code> und <code>make check</code> geben die Wortzahl automatisch in
        der Konsole aus; <code>make wordcount</code> nutzt sie separat:
      </p>
      <CodeBlock
        datei="Terminal"
        code={`$ make build
  Wörter: 2181
✓ thesis.pdf erzeugt`}
      />
      <p>
        Die GitHub-Action schreibt die Wortzahl zusätzlich in die <strong>Lauf-Übersicht</strong>{" "}
        (Step-Summary) jedes Builds – du siehst sie also direkt in der Actions-Ansicht, ohne das
        PDF zu öffnen.
      </p>

      <h2>Bekannte Falle: #abk() wird nicht mitgezählt</h2>
      <p>
        Die Abkürzungs-Funktion <code>#abk("HRM")</code> ist context-basiert – und wordometer
        kann durch context-Auswertungen <em>nicht hindurchzählen</em>. Steckt ein relevanter Teil
        des Textes in solchen Funktionen, fehlen dessen Wörter in der Zählung. Im Praxisbeispiel
        (Branch <code>example-seminararbeit</code>) führte das dazu, dass ein Kürzel als
        Literaltext „Lastkraftwagen (LKW)“ geschrieben wurde, damit die Zahl stimmt.
      </p>
      <Callout titel="Richtwerte des Leitfadens">
        <p>
          Seminararbeiten: Umfang laut Modulbeschreibung (z. B. 4.000 Wörter). Bachelor-Thesis:
          40–60 Seiten, Master-Thesis: 60–80 Seiten – jeweils Textteil ohne Verzeichnisse und
          Anhang. Verbindlich ist immer die Modulbeschreibung bzw. die Absprache mit der
          Betreuung.
        </p>
      </Callout>
    </Seite>
  );
}