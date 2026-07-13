import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Faq() {
  return (
    <Seite
      leitfaden="Hilfe"
      titel="FAQ & bekannte Abweichungen"
      einleitung="Antworten auf häufige Fragen – und eine ehrliche Liste der Stellen, an denen das Template bewusst oder technisch bedingt vom Leitfaden abweicht."
    >
      <h2>Häufige Fragen</h2>

      <h3>„unknown font family: times new roman“ – was tun?</h3>
      <p>
        Die Warnung erscheint auf Systemen ohne Times New Roman (typisch: Linux). Das PDF ist
        trotzdem korrekt – Typst nutzt die mitgelieferte Liberation Serif, die metrisch identisch
        ist. Wer die Warnung loswerden will, installiert die Microsoft-Schriften (
        <code>sudo apt install ttf-mscorefonts-installer</code>) oder setzt in{" "}
        <code>main.typ</code> <code>schriftart: "Liberation Serif"</code>.
      </p>

      <h3>Wie bekomme ich das FOM-Logo auf das Titelblatt?</h3>
      <p>
        Das Logo ist markenrechtlich geschützt und liegt dem Open-Source-Template deshalb nicht
        bei. Für Abschlussarbeiten stellt die FOM das offizielle Titelblatt ohnehin im
        Online-Campus bereit. Wer ein eigenes Logo einbinden darf:
      </p>
      <CodeBlock datei="main.typ" code={`logo: image("abbildungen/logo.png", width: 3.5cm),`} />

      <h3>Mein Betreuer verlangt Seitenzahlen oben rechts</h3>
      <CodeBlock datei="main.typ" code={`seitenzahl-position: "rechts",`} />
      <p>
        Der Leitfaden erlaubt beides: mittig (Standard) oder rechts am Textrand (Leitfaden 1.2
        Nr. 10).
      </p>

      <h3>Wie zitiere ich Gesetze oder Urteile?</h3>
      <p>
        Gesetze werden nach Leitfaden direkt im Text zitiert („… ergibt sich aus § 433 Absatz 2
        BGB.“) und brauchen keinen Eintrag in der <code>.bib</code>-Datei. Für juristische
        Arbeiten verweist der Leitfaden (Anhang 10) auf gesonderte Vorgaben des
        Hochschulbereichs Wirtschaft &amp; Recht – bitte mit der Betreuung abstimmen.
      </p>

      <h3>Kann ich englisch schreiben?</h3>
      <CodeBlock datei="main.typ" code={`sprache: "en",\nsperrvermerk: (ort: "Essen", datum: "…", englisch: true),`} />
      <p>
        Silbentrennung und Anführungszeichen stellen sich um. Verzeichnis-Überschriften lassen
        sich je Funktion übersteuern, z. B.{" "}
        <code>#literaturverzeichnis(titel: "Bibliography")</code>.
      </p>

      <h3>Wie viele Seiten darf meine Arbeit haben?</h3>
      <p>
        Richtwerte des Leitfadens (1.2 Nr. 10): Seminararbeiten nach Modulbeschreibung (z. B.
        4.000 Worte), Bachelor-Thesis 40–60 Seiten, Master-Thesis 60–80 Seiten – jeweils
        Textteil ohne Verzeichnisse und Anhang. Verbindlich ist die Absprache mit dem
        Erstgutachter.
      </p>

      <h2>Bekannte Abweichungen vom Leitfaden</h2>
      <Callout titel="Transparenz">
        <p>
          Diese Punkte sind Detail-Vorgaben, die sich (noch) nicht vollautomatisch umsetzen
          lassen. Sie betreffen Feinheiten des Literaturverzeichnisses und sind nach unserer
          Erfahrung unkritisch – im Zweifel mit der Betreuung klären.
        </p>
      </Callout>
      <ul>
        <li>
          <strong>Zwischenüberschrift „Internetquellen“:</strong> Internetquellen werden korrekt
          ans Ende des Literaturverzeichnisses sortiert, die separate Zwischenüberschrift setzt
          Typst derzeit nicht automatisch (nur eine Bibliographie pro Dokument).
        </li>
        <li>
          <strong>Leerzeile zwischen Anfangsbuchstaben:</strong> Der Leitfaden wünscht eine
          Leerzeile beim Wechsel des Anfangsbuchstabens (A → B); automatisiert wird derzeit ein
          gleichmäßiger Abstand zwischen allen Einträgen gesetzt.
        </li>
        <li>
          <strong>Wiederholte Verfasser:</strong> Mehrere Werke desselben Autors werden
          vollständig genannt statt mit Ersetzungsstrich („–“) – laut Leitfaden ist der Strich
          optional („kann verzichtet werden“).
        </li>
        <li>
          <strong>Hängender Einzug:</strong> beträgt technisch bedingt ca. 0,75 cm statt exakt
          1 cm.
        </li>
      </ul>

      <h2>Fehler gefunden? Frage offen?</h2>
      <p>
        Öffne ein Issue im GitHub-Repository oder verbessere die Vorlage direkt per Pull Request
        – wie das geht, steht in der <code>CONTRIBUTING.md</code>. Der Leitfaden selbst nimmt
        Verbesserungsvorschläge unter <code>formales.arbeiten@fom.de</code> entgegen.
      </p>
    </Seite>
  );
}
