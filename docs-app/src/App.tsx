import { useEffect, useState, type ReactNode } from "react";
import Start from "./inhalte/Start";
import Installation from "./inhalte/Installation";
import Schnellstart from "./inhalte/Schnellstart";
import Zitieren from "./inhalte/Zitieren";
import Literatur from "./inhalte/Literatur";
import Elemente from "./inhalte/Elemente";
import Ki from "./inhalte/Ki";
import Pipeline from "./inhalte/Pipeline";
import Faq from "./inhalte/Faq";


interface Route {
  slug: string;
  titel: string;
  seite: ReactNode;
}

interface Gruppe {
  name: string;
  routen: Route[];
}

const GRUPPEN: Gruppe[] = [
  {
    name: "Einstieg",
    routen: [
      { slug: "", titel: "Überblick", seite: <Start /> },
      { slug: "installation", titel: "Installation", seite: <Installation /> },
      { slug: "schnellstart", titel: "Schnellstart", seite: <Schnellstart /> },
    ],
  },
  {
    name: "Schreiben",
    routen: [
      { slug: "zitieren", titel: "Zitieren", seite: <Zitieren /> },
      { slug: "elemente", titel: "Abbildungen, Tabellen, Formeln", seite: <Elemente /> },
      { slug: "ki", titel: "KI-Nutzung nachweisen", seite: <Ki /> },
    ],
  },
  {
    name: "Literaturverwaltung",
    routen: [{ slug: "literatur", titel: "Zotero & Mendeley", seite: <Literatur /> }],
  },
  {
    name: "Werkzeuge",
    routen: [{ slug: "pipeline", titel: "Build-Pipeline & CI", seite: <Pipeline /> }],
  },
  {
    name: "Hilfe",
    routen: [{ slug: "faq", titel: "FAQ & bekannte Abweichungen", seite: <Faq /> }],
  },
];

const ALLE_ROUTEN = GRUPPEN.flatMap((g) => g.routen);

function aktuellerSlug(): string {
  return window.location.hash.replace(/^#\/?/, "");
}

export default function App() {
  const [slug, setSlug] = useState(aktuellerSlug);
  const [menueOffen, setMenueOffen] = useState(false);

  useEffect(() => {
    const onHash = () => {
      setSlug(aktuellerSlug());
      setMenueOffen(false);
      window.scrollTo({ top: 0 });
    };
    window.addEventListener("hashchange", onHash);
    return () => window.removeEventListener("hashchange", onHash);
  }, []);

  const route = ALLE_ROUTEN.find((r) => r.slug === slug) ?? ALLE_ROUTEN[0];

  return (
    <div className="min-h-screen">
      {/* Kopfleiste */}
      <header className="sticky top-0 z-20 border-b border-blattgrau bg-papier/95 backdrop-blur">
        <div className="mx-auto flex max-w-7xl items-center gap-3 px-4 py-3 lg:px-8">
          <button
            type="button"
            className="rounded-md border border-blattgrau px-2.5 py-1.5 text-sm lg:hidden"
            onClick={() => setMenueOffen((o) => !o)}
            aria-expanded={menueOffen}
            aria-label="Navigation umschalten"
          >
            ☰
          </button>
          <a href="#/" className="flex items-center gap-2.5 no-underline">
            {/* Logomarke: A4-Miniatur */}
            <img className="h-7 w-7" src={`${import.meta.env.BASE_URL}fom-logo.svg`} alt="FOM Logo" />
            <span className="font-display text-lg font-bold tracking-tight">
              FOM-Typst-Template
            </span>
          </a>
          <nav className="ml-auto flex items-center gap-4 text-sm">
            <a
              href="https://github.com/typst/typst"
              target="_blank"
              rel="noreferrer"
              className="hidden text-marginalie hover:text-tinte sm:block"
            >
              Typst
            </a>
            <a
              href="https://github.com/LevinTheDoctor/fom-typst-template"
              target="_blank"
              rel="noreferrer"
              className="rounded-md border border-blattgrau px-3 py-1.5 font-medium text-tinte hover:border-petrol hover:text-petrol-dunkel"
            >
              GitHub&nbsp;↗
            </a>
          </nav>
        </div>
      </header>

      <div className="mx-auto flex max-w-7xl lg:px-4">
        {/* Seitenleiste */}
        <nav
          aria-label="Dokumentation"
          className={`${menueOffen ? "block" : "hidden"} fixed inset-x-0 top-[57px] z-10 max-h-[80vh] overflow-y-auto border-b border-blattgrau bg-papier px-6 pb-6 lg:sticky lg:top-[57px] lg:block lg:h-[calc(100vh-57px)] lg:w-64 lg:shrink-0 lg:border-r lg:border-b-0 lg:px-4`}
        >
          {GRUPPEN.map((gruppe) => (
            <div key={gruppe.name} className="mt-6">
              <p className="px-3 font-mono text-[11px] tracking-widest text-marginalie uppercase">
                {gruppe.name}
              </p>
              <ul className="mt-2 space-y-0.5">
                {gruppe.routen.map((r) => {
                  const aktiv = r.slug === route.slug;
                  return (
                    <li key={r.slug}>
                      <a
                        href={`#/${r.slug}`}
                        aria-current={aktiv ? "page" : undefined}
                        className={`block rounded-md px-3 py-1.5 text-sm ${
                          aktiv
                            ? "bg-petrol-hauch font-semibold text-petrol-dunkel"
                            : "text-tinte-hell hover:bg-blattgrau/50"
                        }`}
                      >
                        {r.titel}
                      </a>
                    </li>
                  );
                })}
              </ul>
            </div>
          ))}
        </nav>

        {/* Inhalt */}
        <main className="min-w-0 flex-1">{route.seite}</main>
      </div>

      <footer className="border-t border-blattgrau py-8 text-center text-sm text-marginalie">
        <p>
          Open-Source-Template für wissenschaftliche Arbeiten nach dem FOM-Leitfaden (Stand Januar
          2024). Kein offizielles Angebot der FOM Hochschule.
        </p>
      </footer>
    </div>
  );
}
