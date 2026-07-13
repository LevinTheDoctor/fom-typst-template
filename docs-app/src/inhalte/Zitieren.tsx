import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Zitieren() {
  return (
    <Seite
      leitfaden="Leitfaden Kapitel 3 · Zitieren"
      titel="Zitieren"
      einleitung="Der Leitfaden erlaubt zwei Zitierweisen: Chicago (Kurzbeleg in der Fußnote) und Harvard (Kurzbeleg in Klammern im Text). Du wählst einmal in main.typ – das Template erledigt Formatierung, Nummerierung und Literaturverzeichnis."
    >
      <h2>Zitierweise wählen</h2>
      <CodeBlock
        datei="main.typ"
        code={`zitierweise: "chicago",   // Fußnoten (Standard)
// oder
zitierweise: "harvard",   // Klammern im Fließtext`}
      />
      <Callout art="achtung" titel="Einmal entscheiden, konsequent bleiben">
        <p>
          Der Leitfaden verlangt, die gewählte Technik in der gesamten Arbeit beizubehalten und
          vorab mit dem Erstgutachter abzustimmen. Ein Wechsel ist hier zum Glück nur eine
          geänderte Zeile – das ganze Dokument formatiert sich um.
        </p>
      </Callout>

      <h2>Die drei Zitier-Funktionen</h2>
      <table>
        <thead>
          <tr>
            <th>Funktion</th>
            <th>Zweck</th>
            <th>Chicago-Ergebnis (Fußnote)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <code>#vgl(&lt;schluessel&gt;, seite: "12")</code>
            </td>
            <td>Indirektes Zitat (sinngemäß)</td>
            <td>Vgl. Mayer, D., Finanzinvestitionen, 2019, S. 12.</td>
          </tr>
          <tr>
            <td>
              <code>#zit(&lt;schluessel&gt;, seite: "12")</code>
            </td>
            <td>Direktes (wörtliches) Zitat</td>
            <td>Mayer, D., Finanzinvestitionen, 2019, S. 12.</td>
          </tr>
          <tr>
            <td>
              <code>#zitat(&lt;schluessel&gt;, seite: "12")</code>
            </td>
            <td>Nur der Kurzbeleg – für eigene Fußnoten</td>
            <td>Mayer, D., Finanzinvestitionen, 2019, S. 12</td>
          </tr>
        </tbody>
      </table>

      <h2>Indirekt zitieren (der Normalfall)</h2>
      <CodeBlock
        datei="content/02-grundlagen.typ"
        code={`Wissenschaftliche Arbeiten leben vom indirekten
Zitieren.#vgl(<theisen2021>, seite: "158")`}
      />
      <p>
        Der <code>&lt;schluessel&gt;</code> ist der BibTeX-Schlüssel aus deiner{" "}
        <code>literatur.bib</code> (siehe <a href="#/literatur">Zotero &amp; Mendeley</a>). Für
        eine entfernte Anlehnung: <code>praefix: "S. dazu"</code>.
      </p>

      <h2>Wörtlich zitieren</h2>
      <CodeBlock
        datei="content/02-grundlagen.typ"
        code={`"Bei Auslassungen zu Beginn und am Ende eines direkten Zitates
stehen keine Auslassungspunkte."#zit(<theisen2021>, seite: "155")`}
      />
      <p>
        Anführungszeichen einfach als <code>"…"</code> tippen – Typst setzt automatisch deutsche
        Anführungszeichen („…“).
      </p>

      <h2>Sonderfälle</h2>
      <h3>Internetquelle ohne Seitenzahl</h3>
      <CodeBlock code={`#vgl(<destatis2024>, seite: "o. S.")`} />
      <h3>Mehrere Quellen in einer Fußnote</h3>
      <p>Nach Leitfaden mit Semikolon getrennt, in chronologischer Reihenfolge:</p>
      <CodeBlock
        code={`#footnote[Vgl. #zitat(<scholz2014personal>, seite: "5");
#zitat(<theisen2021>, seite: "12").]`}
      />
      <h3>Seitenspannen</h3>
      <CodeBlock code={`#vgl(<akerlof1970>, seite: "488 f.")    // folgende Seite
#vgl(<akerlof1970>, seite: "488 ff.")   // fortfolgende
#vgl(<akerlof1970>, seite: "488–500")   // exakte Spanne`} />

      <h2>Was das Template automatisch regelt</h2>
      <ul>
        <li>
          <strong>Stichwort:</strong> Chicago-Kurzbelege nutzen das Feld „Kurztitel“
          (BibTeX: <code>shorttitle</code>) aus der Literaturverwaltung; fehlt es, den vollen
          Titel.
        </li>
        <li>
          <strong>Jahres-Buchstaben:</strong> Zwei Werke desselben Autors aus demselben Jahr
          werden zu 2014a/2014b – im Beleg und im Literaturverzeichnis.
        </li>
        <li>
          <strong>et al.:</strong> Ab drei Verfassern wird im Kurzbeleg nur der erste genannt
          („u. a.“) – im Literaturverzeichnis stehen alle.
        </li>
        <li>
          <strong>o. V. / o. J.:</strong> Fehlende Verfasser oder Jahre werden automatisch
          gekennzeichnet.
        </li>
        <li>
          <strong>Fortlaufende Fußnotennummern</strong> und der Trennstrich zum Text.
        </li>
      </ul>

      <Callout titel="Harvard-Feinheit">
        <p>
          Bei Harvard steht der Beleg <em>vor</em> dem Satzpunkt: „… erhöht werden{" "}
          <code>#vgl(&lt;x&gt;, seite: "12")</code>.“ Bei Chicago folgt die Fußnote{" "}
          <em>nach</em> dem Satzzeichen. Die Beispielkapitel im Branch <code>main</code> sind für
          Chicago gesetzt.
        </p>
      </Callout>
    </Seite>
  );
}
