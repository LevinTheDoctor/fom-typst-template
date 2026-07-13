import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Ki() {
  return (
    <Seite
      leitfaden="Leitfaden 1.6 und 2.9 · KI in wissenschaftlichen Arbeiten"
      titel="KI-Nutzung nachweisen"
      einleitung="Seit 2024 verlangt der Leitfaden zwei Ebenen der Transparenz: einen lokalen Nachweis an jeder übernommenen Stelle und ein summarisches KI-Hilfsmittelverzeichnis. Das Template liefert für beides fertige Bausteine."
    >
      <h2>Wann muss ich KI kennzeichnen?</h2>
      <table>
        <thead>
          <tr>
            <th>Einsatz</th>
            <th>Nachweis nötig?</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Textpassagen, Tabellen oder Grafiken von einer KI generiert und (überarbeitet) übernommen – auch Paraphrasen und Übersetzungen</td>
            <td>
              <strong>Ja:</strong> lokaler Nachweis + Eintrag im KI-Hilfsmittelverzeichnis
            </td>
          </tr>
          <tr>
            <td>Konzeptionelle Hilfe (Themenfindung, Methodenwahl) oder Recherche (z. B. Elicit, ResearchRabbit)</td>
            <td>Nein (Leitfaden 1.6)</td>
          </tr>
          <tr>
            <td>Rechtschreibprüfung, Taschenrechner</td>
            <td>Nein – gehört auch nicht ins Verzeichnis (Leitfaden 2.9)</td>
          </tr>
        </tbody>
      </table>

      <h2>Lokaler Nachweis im Text</h2>
      <p>Überarbeitet übernommene KI-Inhalte (der häufigste Fall):</p>
      <CodeBlock
        datei="content/03-analyse.typ"
        code={`Dieser Absatz wurde mit einer KI-Anwendung paraphrasiert und ist
entsprechend gekennzeichnet.#ki-nachweis(
  system: "ChatGPT",
  version: "4o",
  datum: "01.07.2026",
)`}
      />
      <p>
        Bei Zitierweise Chicago entsteht die Fußnote{" "}
        <span className="font-mono text-[13px]">
          „Vgl. ChatGPT, Version 4o, Zugriff am 01.07.2026.“
        </span>{" "}
        – bei Harvard der Klammerbeleg im Text. Für <em>originalgetreue</em> Übernahmen (Zitat
        der KI in Anführungszeichen) zusätzlich <code>vgl: false</code> setzen.
      </p>

      <h2>KI-Hilfsmittelverzeichnis</h2>
      <p>
        Am Ende von <code>main.typ</code>, nach dem Literaturverzeichnis (Leitfaden 1.1):
      </p>
      <CodeBlock
        datei="main.typ"
        code={`#ki-hilfsmittelverzeichnis((
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
))`}
      />
      <p>
        Der Leitfaden verlangt mindestens Tool und Version; die Spalten „Art der Nutzung“ und
        „Betroffene Teile“ machen die Angaben für Gutachter nachvollziehbarer. Ohne KI-Einsatz:{" "}
        <code>#ki-hilfsmittelverzeichnis(())</code> erzeugt den entsprechenden Hinweissatz.
      </p>

      <Callout art="achtung" titel="Kennzeichnung ersetzt keine Quellenarbeit">
        <p>
          Der Leitfaden warnt ausdrücklich: KI-generierte Aussagen können falsch sein. Inhalte
          prüfen und mit Fachliteratur belegen – die KI-Kennzeichnung ersetzt keine
          Quellenangabe. Je nach Studiengang sind die KI-Chatverläufe zusätzlich als ZIP mit der
          Arbeit einzureichen; das klärt ihr mit der Betreuung.
        </p>
      </Callout>

      <h2>Eigenständigkeitserklärung inklusive</h2>
      <p>
        Die Erklärung nach Anhang 8 des Leitfadens – inklusive des Satzes zur Kenntlichmachung
        KI-generierter Inhalte – fügt eine Zeile ein:
      </p>
      <CodeBlock datei="main.typ" code={`#eigenstaendigkeitserklaerung(ort: "Essen", datum: "25.01.2027")`} />
      <p>
        Sie erhält vorschriftsgemäß keine Seitenzahl und erscheint nicht im Inhaltsverzeichnis.
      </p>
    </Seite>
  );
}
