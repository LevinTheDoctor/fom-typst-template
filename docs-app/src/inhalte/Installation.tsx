import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Tabs from "../komponenten/Tabs";
import Callout from "../komponenten/Callout";

export default function Installation() {
  return (
    <Seite
      leitfaden="Schritt 1 von 3"
      titel="Installation"
      einleitung="Du brauchst genau zwei Dinge: die Typst-CLI und dieses Template. Beides ist in wenigen Minuten eingerichtet – ganz ohne Programmiererfahrung."
    >
      <h2>Typst installieren</h2>
      <Tabs
        tabs={[
          {
            titel: "Windows",
            inhalt: (
              <>
                <p>Im Terminal (PowerShell) mit dem vorinstallierten Paketmanager winget:</p>
                <CodeBlock datei="PowerShell" code={`winget install --id Typst.Typst`} />
                <p>
                  Danach das Terminal einmal schließen und neu öffnen, damit der Befehl{" "}
                  <code>typst</code> gefunden wird. Prüfen mit:
                </p>
                <CodeBlock datei="PowerShell" code={`typst --version`} />
              </>
            ),
          },
          {
            titel: "macOS",
            inhalt: (
              <>
                <p>
                  Mit{" "}
                  <a href="https://brew.sh" target="_blank" rel="noreferrer">
                    Homebrew
                  </a>
                  :
                </p>
                <CodeBlock datei="Terminal" code={`brew install typst\ntypst --version`} />
              </>
            ),
          },
          {
            titel: "Linux",
            inhalt: (
              <>
                <p>
                  Fertiges Binary von der{" "}
                  <a
                    href="https://github.com/typst/typst/releases"
                    target="_blank"
                    rel="noreferrer"
                  >
                    Typst-Release-Seite
                  </a>{" "}
                  laden – für x86_64 zum Beispiel:
                </p>
                <CodeBlock
                  datei="Terminal"
                  code={`curl -fsSL https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz | tar -xJ
sudo mv typst-x86_64-unknown-linux-musl/typst /usr/local/bin/
typst --version`}
                />
                <p>
                  Alternativ über den Paketmanager (<code>pacman -S typst</code>,{" "}
                  <code>apt install typst</code> ab Ubuntu 24.04) oder{" "}
                  <code>cargo install --locked typst-cli</code>.
                </p>
              </>
            ),
          },
        ]}
      />

      <h2>Template herunterladen</h2>
      <p>
        Auf der GitHub-Seite des Templates <strong>„Use this template“ → „Create a new
        repository“</strong> wählen (empfohlen, dann hast du direkt eine eigene Kopie mit
        Versionsverwaltung) – oder klassisch klonen:
      </p>
      <CodeBlock
        datei="Terminal"
        code={`git clone https://github.com/DEIN-BENUTZERNAME/fom-typst-template.git meine-thesis
cd meine-thesis`}
      />
      <Callout titel="Ohne Git?">
        <p>
          Auf GitHub unter <strong>Code → Download ZIP</strong> lässt sich das Template auch ohne
          Git herunterladen und entpacken. Für die Abgabe empfiehlt sich Git trotzdem: Jeder
          Zwischenstand bleibt gesichert.
        </p>
      </Callout>

      <h2>Erster Testlauf</h2>
      <p>Im Projektordner:</p>
      <CodeBlock datei="Terminal" code={`typst compile --font-path fonts main.typ thesis.pdf`} />
      <p>
        Wenn eine <code>thesis.pdf</code> mit Titelblatt, Verzeichnissen und Beispieltext
        entsteht: fertig. Weiter geht es im <a href="#/schnellstart">Schnellstart</a>.
      </p>

      <h2>Empfohlen: VS Code mit Tinymist</h2>
      <p>
        Für komfortables Schreiben mit Live-Vorschau (Änderung tippen → PDF aktualisiert sich
        sofort):
      </p>
      <ol>
        <li>
          <a href="https://code.visualstudio.com" target="_blank" rel="noreferrer">
            Visual Studio Code
          </a>{" "}
          installieren.
        </li>
        <li>
          In VS Code die Erweiterung <strong>Tinymist Typst</strong> installieren (wird beim
          Öffnen des Projekts automatisch vorgeschlagen).
        </li>
        <li>
          <code>main.typ</code> öffnen und oben rechts auf das Vorschau-Symbol klicken.
        </li>
      </ol>

      <h2>Alternative: Gar nichts installieren</h2>
      <h3>Dev-Container</h3>
      <p>
        Mit Docker und VS Code genügt <strong>„Reopen in Container“</strong> – Typst, Node.js und
        alle Erweiterungen werden automatisch eingerichtet (Konfiguration liegt in{" "}
        <code>.devcontainer/</code>).
      </p>
      <h3>Docker direkt</h3>
      <CodeBlock datei="Terminal" code={`make docker`} />
      <h3>Typst-Web-App</h3>
      <p>
        Unter{" "}
        <a href="https://typst.app" target="_blank" rel="noreferrer">
          typst.app
        </a>{" "}
        läuft Typst komplett im Browser. Dazu die Projektdateien hochladen; die Live-Vorschau ist
        dort eingebaut.
      </p>

      <Callout art="achtung" titel="Schriftart Times New Roman">
        <p>
          Unter Windows und macOS ist Times New Roman vorinstalliert. Unter Linux nutzt das
          Template automatisch die mitgelieferte, metrisch kompatible <em>Liberation Serif</em>{" "}
          aus dem Ordner <code>fonts/</code> – deshalb gehört{" "}
          <code>--font-path fonts</code> in jeden Kompilier-Befehl (Makefile und Skripte machen
          das bereits).
        </p>
      </Callout>
    </Seite>
  );
}
