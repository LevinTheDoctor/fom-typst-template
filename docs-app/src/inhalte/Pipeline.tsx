import Seite from "../komponenten/Seite";
import CodeBlock from "../komponenten/CodeBlock";
import Callout from "../komponenten/Callout";

export default function Pipeline() {
  return (
    <Seite
      leitfaden="Werkzeuge"
      titel="Build-Pipeline & CI"
      einleitung="Ein Befehl, ein PDF – auf Windows, macOS, Linux, im Docker-Container und automatisch bei jedem Push auf GitHub."
    >
      <h2>Lokal bauen</h2>
      <table>
        <thead>
          <tr>
            <th>Befehl</th>
            <th>Was passiert</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <code>make build</code>
            </td>
            <td>
              Kompiliert <code>main.typ</code> zu <code>thesis.pdf</code>
            </td>
          </tr>
          <tr>
            <td>
              <code>make watch</code>
            </td>
            <td>Live-Vorschau: kompiliert bei jedem Speichern neu</td>
          </tr>
          <tr>
            <td>
              <code>make check</code>
            </td>
            <td>Strenger Build – schlägt auch bei Warnungen fehl (wie in der CI)</td>
          </tr>
          <tr>
            <td>
              <code>make docs</code> / <code>make docs-dev</code>
            </td>
            <td>Diese Doku-Webseite bauen bzw. lokal starten</td>
          </tr>
          <tr>
            <td>
              <code>make docker</code>
            </td>
            <td>PDF reproduzierbar im Container bauen – ohne lokale Typst-Installation</td>
          </tr>
        </tbody>
      </table>
      <p>
        Unter Windows (ohne <code>make</code>) übernehmen die PowerShell-Skripte:
      </p>
      <CodeBlock
        datei="PowerShell"
        code={`.\\scripts\\build.ps1          # kompilieren
.\\scripts\\build.ps1 -Watch   # Live-Vorschau`}
      />
      <p>
        Unter macOS/Linux gibt es äquivalent <code>./scripts/build.sh</code> und{" "}
        <code>./scripts/build.sh watch</code>.
      </p>

      <h2>GitHub Actions: PDF bei jedem Push</h2>
      <p>
        Der Workflow <code>.github/workflows/pdf-bauen.yml</code> kompiliert die Arbeit bei jedem
        Push und Pull Request. Das fertige PDF hängt als Artefakt „thesis“ am Workflow-Lauf –
        praktisch, um Zwischenstände mit der Betreuung zu teilen, ohne PDFs zu verschicken.
      </p>
      <ul>
        <li>Installiert Typst und Times New Roman automatisch auf dem Build-Server.</li>
        <li>
          Nutzt <code>make check</code>: Schon eine Warnung (kaputter Verweis, fehlende Datei)
          lässt den Build rot werden, bevor es der Gutachter merkt.
        </li>
      </ul>

      <h2>Doku-Webseite auf Cloudflare Workers</h2>
      <p>
        Diese Webseite (<a href="https://fom-typst.levin-dev.de">fom-typst.levin-dev.de</a>) wird
        aus <code>docs-app/</code> gebaut (<code>npm run build</code> → <code>dist/</code>) und
        über Cloudflare Workers (Static Assets) ausgeliefert. Da <code>base: "./"</code> zusammen
        mit dem Hash-Routing nutzt, läuft das gleiche <code>dist/</code>-Verzeichnis ohne
        Anpassungen auf jedem Static-Host.
      </p>

      <h2>Docker & Dev-Container</h2>
      <CodeBlock
        datei="Terminal"
        code={`# PDF im Container bauen (identisches Ergebnis auf jedem Rechner)
docker build -t fom-typst-template .
docker run --rm -v "$(pwd)":/arbeit fom-typst-template`}
      />
      <p>
        Für VS-Code-Nutzer liegt in <code>.devcontainer/</code> eine fertige Umgebung mit Typst,
        Node.js und der Tinymist-Erweiterung: <strong>„Reopen in Container“</strong> genügt.
      </p>

      <Callout titel="Warum ist das PDF überall identisch?">
        <p>
          Die Fallback-Schrift Liberation Serif liegt im Repository (<code>fonts/</code>) und
          wird über <code>--font-path fonts</code> eingebunden. Typst selbst ist deterministisch:
          gleiche Eingabe, gleiches PDF – auf jedem Betriebssystem.
        </p>
      </Callout>

      <h2>Empfohlener Git-Arbeitsablauf</h2>
      <CodeBlock
        datei="Terminal"
        code={`git add .
git commit -m "Kapitel 2.1 Begriffsabgrenzungen"
git push               # -> CI baut und prüft das PDF automatisch`}
      />
      <p>
        Committe kleine, benannte Stände (pro Abschnitt oder Schreibtag). So lässt sich jede
        Version wiederherstellen – und die CI hat bei jedem Push geprüft, dass die Arbeit noch
        fehlerfrei kompiliert.
      </p>
    </Seite>
  );
}
