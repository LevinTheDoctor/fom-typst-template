import CodeBlock from "../komponenten/CodeBlock";
import Satzspiegel from "../komponenten/Satzspiegel";

export default function Start() {
  return (
    <div>
      {/* Held: Satzspiegel als These */}
      <section className="border-b border-blattgrau bg-white">
        <div className="mx-auto grid max-w-5xl items-center gap-10 px-6 py-14 lg:grid-cols-[1.2fr_1fr] lg:px-10">
          <div>
            <p className="mb-3 font-mono text-xs tracking-widest text-petrol-dunkel uppercase">
              Typst-Template · FOM-Leitfaden Januar 2024
            </p>
            <h1 className="font-display text-4xl leading-tight font-bold tracking-tight lg:text-5xl">
              Die Formalia stimmen.
              <br />
              Du schreibst nur noch.
            </h1>
            <p className="mt-5 max-w-[55ch] text-lg leading-relaxed text-marginalie">
              Seitenränder, Zitierweise, Verzeichnisse, KI-Nachweise: Dieses Template setzt den
              FOM-Leitfaden für Seminar- und Abschlussarbeiten automatisch um – mit{" "}
              <a
                className="font-medium text-petrol-dunkel underline decoration-petrol/40 underline-offset-2"
                href="https://typst.app"
                target="_blank"
                rel="noreferrer"
              >
                Typst
              </a>
              , einem modernen, schnellen Satzsystem.
            </p>
            <div className="mt-7 flex flex-wrap gap-3">
              <a
                href="#/schnellstart"
                className="rounded-md bg-petrol px-5 py-2.5 font-medium text-white shadow-sm hover:bg-petrol-dunkel"
              >
                Schnellstart
              </a>
              <a
                href="#/installation"
                className="rounded-md border border-blattgrau bg-white px-5 py-2.5 font-medium hover:border-petrol hover:text-petrol-dunkel"
              >
                Installation
              </a>
            </div>
          </div>
          <Satzspiegel />
        </div>
      </section>

      <section className="mx-auto max-w-5xl px-6 py-12 lg:px-10">
        <div className="grid gap-6 md:grid-cols-3">
          {[
            {
              titel: "Leitfaden-konform",
              text: "Ränder 4/2/4/2 cm, Times New Roman 12 pt, 1,5-zeilig, römische und arabische Seitenzahlen, alle Pflichtverzeichnisse – vorkonfiguriert nach Leitfaden Kapitel 1 und 2.",
            },
            {
              titel: "Zitieren ohne Handarbeit",
              text: "Chicago-Fußnoten mit Stichwort oder Harvard im Text: #vgl(...) genügt. Das Literaturverzeichnis entsteht automatisch aus Zotero- oder Mendeley-Exporten.",
            },
            {
              titel: "KI transparent deklariert",
              text: "Lokale KI-Nachweise per #ki-nachweis(...) und ein fertiges KI-Hilfsmittelverzeichnis nach Leitfaden 1.6 und 2.9 – Pflicht seit 2024.",
            },
          ].map((k) => (
            <div key={k.titel} className="rounded-lg border border-blattgrau bg-white p-5">
              <h2 className="font-display text-lg font-semibold">{k.titel}</h2>
              <p className="mt-2 text-sm leading-relaxed text-marginalie">{k.text}</p>
            </div>
          ))}
        </div>

        <h2 className="font-display mt-14 text-2xl font-semibold">So fühlt es sich an</h2>
        <p className="mt-2 max-w-[65ch] text-marginalie">
          Eine Fußnote im FOM-Chicago-Stil – Kurzbeleg, Stichwort, Seitenzahl – ist eine Zeile
          Typst. Kein Feldfunktionen-Chaos, keine verrutschten Formatvorlagen.
        </p>
        <CodeBlock
          datei="content/01-einleitung.typ"
          code={`Die Einleitung umfasst eine Hinführung zum Thema, die Problemstellung
sowie die Zielsetzung der Arbeit.#vgl(<theisen2021>, seite: "136")`}
        />
        <p className="text-sm text-marginalie">
          ergibt im PDF die Fußnote:{" "}
          <span className="font-mono text-[13px]">
            ¹ Vgl. Theisen, M. R., Wissenschaftliches Arbeiten, 2021, S. 136.
          </span>
        </p>

        <h2 className="font-display mt-14 text-2xl font-semibold">Drei Varianten, ein Repository</h2>
        <table className="my-5 w-full border-collapse text-sm">
          <thead>
            <tr>
              <th className="border border-blattgrau bg-petrol-hauch px-3 py-2 text-left">Branch</th>
              <th className="border border-blattgrau bg-petrol-hauch px-3 py-2 text-left">Zweck</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td className="border border-blattgrau px-3 py-2 font-mono text-[13px]">main</td>
              <td className="border border-blattgrau px-3 py-2">
                Basis-Template mit kompakten Beispielkapiteln, die jede Funktion einmal zeigen –
                der empfohlene Startpunkt.
              </td>
            </tr>
            <tr>
              <td className="border border-blattgrau px-3 py-2 font-mono text-[13px]">
                example-thesis
              </td>
              <td className="border border-blattgrau px-3 py-2">
                Vollständig ausgefüllte Musterarbeit zum Nachschlagen: So sieht das fertige
                Ergebnis aus.
              </td>
            </tr>
            <tr>
              <td className="border border-blattgrau px-3 py-2 font-mono text-[13px]">minimal</td>
              <td className="border border-blattgrau px-3 py-2">
                Leeres Grundgerüst ohne Beispieltexte und ohne Doku-Webseite – direkt losschreiben.
              </td>
            </tr>
          </tbody>
        </table>
      </section>
    </div>
  );
}
