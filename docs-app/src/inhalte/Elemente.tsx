import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Elemente() {
  return (
    <Seite
      leitfaden="Leitfaden 2.3 und 2.5 · Abbildungen, Tabellen, Formeln"
      titel="Abbildungen, Tabellen und Formeln"
      einleitung="Beschriftung oberhalb, Quelle unterhalb, fortlaufende Nummerierung, automatische Verzeichnisse – die Helfer #abbildung, #tabelle und #formel setzen alle Vorgaben des Leitfadens um."
    >
      <h2>Abbildungen</h2>
      <p>
        Bilddatei in den Ordner <code>abbildungen/</code> legen und einbinden:
      </p>
      <CodeBlock
        datei="content/03-analyse.typ"
        code={`#abbildung(
  image("../abbildungen/verbreitung.png", width: 80%),
  titel: [Anteil der Erwerbstätigen mit Arbeit im Homeoffice],
  quelle: [In Anlehnung an #zitat(<destatis2024>, seite: "o. S.")],
) <abb-verbreitung>

Wie @abb-verbreitung zeigt, nimmt die Verbreitung zu.`}
      />
      <p>Das erzeugt:</p>
      <ul>
        <li>
          <strong>„Abbildung 1: Anteil …“</strong> – fett und linksbündig <em>oberhalb</em> der
          Grafik (Leitfaden 2.3),
        </li>
        <li>
          <strong>„Quelle: In Anlehnung an Statistisches Bundesamt, …“</strong> direkt darunter,
        </li>
        <li>einen Eintrag im automatischen Abbildungsverzeichnis,</li>
        <li>
          per <code>@abb-verbreitung</code> einen klickbaren Querverweis („Abbildung 1“).
        </li>
      </ul>
      <Callout titel="Drei Quellen-Varianten (Leitfaden 2.3)">
        <p>
          Übernommen: <code>quelle: [#zitat(&lt;langguth2008&gt;, seite: "8")]</code> · In
          Anlehnung: <code>quelle: [In Anlehnung an #zitat(...)]</code> · Selbst erstellt:{" "}
          <code>quelle: "Eigene Darstellung"</code> (Standardwert).
        </p>
      </Callout>

      <h2>Tabellen</h2>
      <CodeBlock
        datei="content/03-analyse.typ"
        code={`#tabelle(
  table(
    columns: (1.2fr, 1fr, 1fr),
    stroke: 0.5pt,
    table.header([*Einflussfaktor*], [*Wirkung*], [*Evidenz*]),
    [Autonomie],        [positiv], [hoch],
    [Soziale Isolation], [negativ], [mittel],
  ),
  titel: [Einflussfaktoren der Mitarbeiterzufriedenheit],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<scholz2014personal>, seite: "412")],
) <tab-faktoren>`}
      />
      <p>
        Tabellen werden getrennt von Abbildungen nummeriert und erhalten ihr eigenes
        Tabellenverzeichnis – beides fortlaufend und automatisch.
      </p>

      <h2>Formeln</h2>
      <CodeBlock
        datei="content/02-grundlagen.typ"
        code={`#formel(
  $(a + b)^2 = (a + b) dot (a + b) = a^2 + 2 a b + b^2$,
  titel: [Erste binomische Formel],
  quelle: [In Anlehnung an #zitat(<theisen2021>, seite: "44")],
) <formel-binomisch>`}
      />
      <p>Nach Leitfaden 2.5 wird die Formel:</p>
      <ul>
        <li>um 1 cm eingerückt,</li>
        <li>rechts fortlaufend nummeriert – „(1)“, „(2)“ …,</li>
        <li>mit Überschrift („Formel 1: …“) und Quelle versehen,</li>
        <li>im Formelverzeichnis aufgeführt.</li>
      </ul>
      <p>
        Für Umformungen derselben Formel: <code>zusatz: "a"</code> ergibt „(1a)“, ohne die
        Zählung weiterlaufen zu lassen.
      </p>

      <h2>Abkürzungen</h2>
      <CodeBlock
        datei="main.typ + Text"
        code={`// in main.typ definieren:
abkuerzungen: (
  "HRM": "Human Resource Management",
  "IKT": "Informations- und Kommunikationstechnik",
),

// im Text verwenden:
Unter #abk("HRM") versteht man …   // 1. Mal: "Human Resource Management (HRM)"
Das #abk("HRM") umfasst …          // danach: "HRM"`}
      />
      <p>
        Das Abkürzungsverzeichnis listet automatisch nur die tatsächlich verwendeten Abkürzungen,
        alphabetisch sortiert. Allgemein gebräuchliche Abkürzungen („z. B.“, „usw.“) gehören laut
        Leitfaden 2.4 <em>nicht</em> hinein – einfach normal ausschreiben.
      </p>

      <h2>Anhang</h2>
      <CodeBlock
        datei="main.typ"
        code={`#anhang[
  #anhang-abschnitt([Verwendeter Fragebogen])[
    Inhalt des Anhangs …
  ]
  #anhang-abschnitt([Deskriptive Datenauswertungen])[
    Alle Elemente werden hier wie im Textteil beschriftet und belegt.
  ]
]`}
      />
      <p>
        Jeder Abschnitt wird automatisch „Anhang 1: …“, „Anhang 2: …“ benannt und ins
        Inhaltsverzeichnis übernommen (Leitfaden 2.8).
      </p>
    </Seite>
  );
}
