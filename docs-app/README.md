# docs-app – Doku-Webseite des FOM-Typst-Templates

Vite + React 19 + TypeScript + Tailwind CSS 4. Live unter
<https://fom-typst.levin-dev.de>. Diese Seite erklärt, wie die App aufgebaut ist
und wie man sie **frei erweitert** – ohne Router-Paket, ohne Build-Anpassungen.

## Entwickeln & Bauen

```bash
npm install
npm run dev      # lokaler Dev-Server (Vite)
npm run build    # tsc + vite build → dist/
npm run preview  # dist/ lokal ansehen
```

Im Projekt-Root geht auch `make docs-dev` / `make docs`.

## Architektur in einem Satz

Eine Single-Page-App mit **Hash-Routing** (`#/slug`), die in `App.tsx` eine
einfache Registry (`GRUPPEN`) ausliest – jede Route ist eine Komponente unter
`src/inhalte/`.

```
docs-app/
├── index.html              SPA-Root, Source Serif 4 via Google Fonts
├── vite.config.ts          base: "./" + react + tailwindcss Plugins
└── src/
    ├── main.tsx            Einstieg
    ├── index.css           Design-Token via @theme (Papier/Tinte/Petrol)
    ├── App.tsx             ★ ERWEITERUNGSPUNKT: Navigation + Registry GRUPPEN
    ├── inhalte/            ★ je Route eine Seite (Start.tsx, Zitieren.tsx, …)
    └── komponenten/        wiederverwendbare Bausteine (siehe unten)
```

Dank `base: "./"` + Hash-Routing läuft `dist/` auf **jedem Static-Host**, egal
in welchem Unterverzeichnis. Deployment: Cloudflare Workers (Static Assets,
außerhalb dieses Repos konfiguriert).

## Seite hinzufügen (2 Schritte)

1. **Datei anlegen:** `src/inhalte/MeineSeite.tsx` nach diesem Muster:

   ```tsx
   import Seite from "../komponenten/Seite";
   import CodeBlock from "../komponenten/CodeBlock";
   import Callout from "../komponenten/Callout";

   export default function MeineSeite() {
     return (
       <Seite
         leitfaden="Leitfaden X.Y"   /* optionaler Eyebrow über dem Titel */
         titel="Meine Seite"
         einleitung="Ein bis zwei Sätze Einleitung."
       >
         <h2>Abschnitt</h2>
         <p>Text …</p>
       </Seite>
     );
   }
   ```

2. **Route registrieren:** in `App.tsx` importieren und in `GRUPPEN` eintragen:

   ```tsx
   import MeineSeite from "./inhalte/MeineSeite";

   // …
   {
     name: "Schreiben",
     routen: [
       /* … */
       { slug: "meine-seite", titel: "Meine Seite", seite: <MeineSeite /> },
     ],
   },
   ```

Das war alles – die Navigation (Desktop-Seitenleiste + mobiles Menü) entsteht
automatisch aus der Registry, Hash-Routing und 404-Fallback inklusive.

### Konventionen

- **slug:** klein, kebab-case (`meine-seite`); die Startseite hat den leeren
  Slug `""`. Die URL ist dann `#/meine-seite`.
- **Titel/Sprache:** Deutsch, du-Form, wie der Rest der Doku.
- **`leitfaden`-Eyebrow** nur setzen, wenn die Seite wirklich ein
  Leitfaden-Kapitel umsetzt.
- Neue Gruppe? Einfach ein weiteres Objekt mit `name` + `routen` in `GRUPPEN`
  anlegen.

## Bausteine (src/komponenten/)

| Baustein | Props | Zweck |
|---|---|---|
| `Seite` | `leitfaden?`, `titel`, `einleitung?`, `children` | Seitengerüst: Eyebrow, Serifen-Titel, fertiges Artikel-Styling (h2/h3, Listen, Tabellen, Code, Links) über eine zentrale Tailwind-Arbitrary-Variant-Klasse |
| `CodeBlock` | `code`, `datei?` | Codeblock mit Kopieren-Button, Dateiname als Kontextzeile; schlanke Syntax-Hervorhebung für Typst/Shell/Kommentare |
| `Callout` | `art?: "hinweis" \| "achtung"`, `titel?`, `children` | Hervorgehobener Kasten (petrol/amber), angelehnt an die „Zusatzinformation“-Kästen des Leitfadens |
| `Tabs` | `tabs: {titel, inhalt}[]` | Umschaltbare Reiter, z. B. Windows/macOS/Linux |
| `Satzspiegel` | – | Animierter Hero (Startseite) |

## Design-Token

In `src/index.css` unter `@theme`: `papier`, `tinte`, `tinte-hell`,
`blattgrau`, `marginalie`, `petrol` (plus `-dunkel`, `-hauch`), `font-display`.
Farben nur über diese Tokens nutzen, keine Hex-Werte in die Seiten.

## Erweiterungsideen (bewusst offen)

- Suche: `GRUPPEN` ist ein flaches Array – leicht für Client-Suche indizierbar.
- Router-Paket (react-router): nicht nötig; Hash-Routing reicht für Static
  Hosting. Wer es trotzdem will: `App.tsx` ist die einzige Stelle, die
  umgebaut werden müsste.
- Deployment auf GitHub Pages o. Ä.: einfach `dist/` hochladen – `base: "./"`
  und Hash-Routing machen es host-agnostic.