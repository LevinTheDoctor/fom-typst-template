import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Zitieren() {
  return (
    <Seite
      leitfaden="Leitfaden Kapitel 3 · Zitieren"
      titel="Zitieren"
      einleitung="Der Leitfaden erlaubt zwei Zitierweisen: Chicago (Kurzbeleg in der Fußnote) und Harvard (Kurzbeleg in Klammern im Text). Als dritte, optionale Variante steht APA 7 bereit. Du wählst einmal in main.typ – das Template erledigt Formatierung, Nummerierung und Literaturverzeichnis."
    >
      <h2>Zitierweise wählen</h2>
      <CodeBlock
        datei="main.typ"
        code={`zitierweise: "chicago",   // Fußnoten (Standard)
zitierweise: "harvard",   // Klammern im Fließtext
zitierweise: "apa",       // Klammern im Text nach APA 7`}
      />
      <Callout titel="APA ist eine Zugabe, kein Leitfaden-Stil">
        <p>
          Der FOM-Leitfaden kennt nur Chicago und Harvard (Kap. 3.2). <code>"apa"</code> ist
          eine zusätzliche Option nach APA 7th Edition – technisch verhält sie sich wie Harvard
          (Klammerbeleg im Text), formatiert Beleg und Literaturverzeichnis aber nach APA:
          Klammer-Jahr direkt hinter dem Verfasser, kursive Werktitel, „&“ vor dem letzten
          Verfasser, Vornamen als Initialen. Stimme sie vorab mit deinem Erstgutachter ab.
        </p>
      </Callout>
      <Callout art="achtung" titel="Einmal entscheiden, konsequent bleiben">
        <p>
          Der Leitfaden verlangt, die gewählte Technik in der gesamten Arbeit beizubehalten und
          vorab mit dem Erstgutachter abzustimmen. Ein Wechsel ist hier zum Glück nur eine
          geänderte Zeile – das ganze Dokument formatiert sich um.
        </p>
      </Callout>

      <h2>Die Zitier-Funktionen im Überblick</h2>
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
              <code>#vgl(&lt;q&gt;, seite: "12")</code>
            </td>
            <td>Indirektes Zitat (sinngemäß)</td>
            <td>Vgl. Mayer, D., Finanzinvestitionen, 2019, S. 12.</td>
          </tr>
          <tr>
            <td>
              <code>#zit(&lt;q&gt;, seite: "12")</code>
            </td>
            <td>Direktes (wörtliches) Zitat</td>
            <td>Mayer, D., Finanzinvestitionen, 2019, S. 12.</td>
          </tr>
          <tr>
            <td>
              <code>#zitat(&lt;q&gt;, seite: "12")</code>
            </td>
            <td>Nur der Kurzbeleg – für eigene Fußnoten</td>
            <td>Mayer, D., Finanzinvestitionen, 2019, S. 12</td>
          </tr>
          <tr>
            <td>
              <code>#vgl-kap(&lt;q&gt;, kap: "3.2")</code>
            </td>
            <td>Indirekt, mit Kapitelangabe (E-Books ohne verlagsgetreue Seiten)</td>
            <td>Vgl. Medina, Cybernetic Revolutionaries, 2014, Kap. 3.2.</td>
          </tr>
          <tr>
            <td>
              <code>#zit-kap(&lt;q&gt;, kap: "3.2")</code>
            </td>
            <td>Direkt, mit Kapitelangabe</td>
            <td>Medina, Cybernetic Revolutionaries, 2014, Kap. 3.2.</td>
          </tr>
          <tr>
            <td>
              <code>#vgl-nach(&lt;orig&gt;, &lt;sek&gt;, seite: "12", seite-sek: "88")</code>
            </td>
            <td>Sekundärzitat (aus zweiter Hand)</td>
            <td>Vgl. Wiener, 1948, S. 12, zitiert nach Medina, 2014, S. 88.</td>
          </tr>
          <tr>
            <td>
              <code>#zit-nach(…)</code> · <code>#zitat-nach(…)</code>
            </td>
            <td>Direkt/nackt als Sekundärzitat</td>
            <td>Wiener, 1948, S. 12, zitiert nach Medina, 2014, S. 88.</td>
          </tr>
          <tr>
            <td>
              <code>#vgl-nach-kap(&lt;orig&gt;, &lt;sek&gt;, kap: "2", kap-sek: "5")</code>
            </td>
            <td>Sekundärzitat, wenn Quellen keine Seitenzahlen haben; <code>seite</code>/
              <code>seite-sek</code> und <code>kap</code>/<code>kap-sek</code> sind frei mischbar
            </td>
            <td>Vgl. Sprague, 1980, Kap. 2, zitiert nach Gluchowski, 2008, Kap. 5.</td>
          </tr>
          <tr>
            <td>
              <code>#zitat-kap(…)</code> · <code>#zitat-nach-kap(…)</code>
            </td>
            <td>Nackte Kurzbelege für die Kombination in eigenen Fußnoten</td>
            <td>–</td>
          </tr>
        </tbody>
      </table>
      <p>
        Die <code>-kap</code>-Varianten nehmen <code>kap:</code> statt <code>seite:</code>; die{" "}
        <code>-nach</code>-Varianten erwarten zwei Schlüssel: erst das <em>Original</em>, dann die{" "}
        <em>Sekundärquelle</em> (nur die Sekundärquelle muss in der <code>.bib</code> stehen – das
        Original erscheint nicht im Literaturverzeichnis).
      </p>

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

      <h3>„ebd." bei wiederholtem Beleg</h3>
      <p>
        Zitierst du unmittelbar erneut dieselbe Quelle, ersetzt das Template den Kurzbeleg
        automatisch durch „ebd." (Leitfaden 3.2) – eine abweichende Seitenangabe bleibt erhalten.
        Jede andere Fußnote (auch eine erklärende) unterbricht die Kette.
      </p>
      <CodeBlock code={`#vgl(<mayer2019>, seite: "438")   // Vgl. Mayer, D., Finanzinv., 2019, S. 438.
#vgl(<mayer2019>, seite: "440")   // Vgl. ebd., S. 440.
#vgl(<mayer2019>)                 // Vgl. ebd.`} />
      <p>
        Abschalten lässt sich die Automatik dokumentweit mit{" "}
        <code>fom-arbeit(ebd: false)</code> oder für einen einzelnen Beleg mit{" "}
        <code>#vgl(…, ebd: false)</code> – etwa wenn der vorangehende Beleg durch einen
        Seitenumbruch weit entfernt steht.
      </p>

      <h3>Quellen ohne Erscheinungsjahr: Schlusspunkt steuern</h3>
      <p>
        Endet der Kurzbeleg selbst auf einen Punkt (etwa „…, o. J."), darf die Fußnote keinen
        zweiten setzen. Bei der Seitenangabe (<code>"o. S."</code>) erkennen die Helfer das
        selbst; nur wenn die CSL „o. J." einsetzt, unterdrückt <code>punkt: false</code> den
        Schlusspunkt:
      </p>
      <CodeBlock code={`#vgl(<WhatCloudWatch>, punkt: false)   // Vgl. AWS, CloudWatch, o. J.`} />

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

      <Callout titel="Harvard-/APA-Feinheit">
        <p>
          Bei Harvard und APA steht der Beleg <em>vor</em> dem Satzpunkt: „… erhöht werden{" "}
          <code>#vgl(&lt;x&gt;, seite: "12")</code>.“ Bei Chicago folgt die Fußnote{" "}
          <em>nach</em> dem Satzzeichen. Die Beispielkapitel im Branch <code>webapp</code> sind
          für Chicago gesetzt.
        </p>
      </Callout>

      <h2>Praxisbeispiel</h2>
      <p>
        Der Branch <code>example-seminararbeit</code> zeigt alle Funktionen im echten Einsatz:
        ebd.-Folgebelege, Sekundärzitate über <code>#vgl-nach-kap</code>, Kapitelbelege für
        E-Books, getrennte Internetquellen und Herausgeberbände über{" "}
        <code>zusaetzlich:</code>.
      </p>
    </Seite>
  );
}
