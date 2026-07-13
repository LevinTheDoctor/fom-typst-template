# CLAUDE.md – Projektwissen für KI-gestützte Weiterentwicklung

Dieses Dokument beschreibt Architektur, Entscheidungen und Erweiterungspunkte des
FOM-Typst-Templates, damit spätere Sessions (oder andere Mitwirkende) nahtlos
weiterarbeiten können.

## Was dieses Repository ist

Ein GitHub-Template-Repository für wissenschaftliche Arbeiten an der FOM Hochschule
auf Basis von **Typst** (getestet mit Typst 0.15). Es setzt den *Leitfaden zur
formalen Gestaltung von Seminar- und Abschlussarbeiten* (Stand Januar 2024) um; die
Quell-PDF liegt im Repo-Root (`2024_Leitfaden-WManagement-GuS-WRecht.pdf`, 73 Seiten).

**Der Leitfaden ist die Spezifikation.** Jede Layoutregel im Code trägt einen
Kommentar mit Kapitelverweis (z. B. „Leitfaden 1.2 Nr. 9“). Bei Unklarheiten immer
zuerst dort nachlesen.

## Extrahierte Kernanforderungen des Leitfadens

- **Layout (Kap. 1.2):** DIN A4; Ränder oben 4 cm / unten 2 cm / links 4 cm /
  rechts 2 cm; Kopf-/Fußzeile 2 cm vom Rand; TNR 12 pt oder Arial 11,5 pt;
  1,5-zeilig; Absatzabstand 0/6 pt; Überschriften + Beschriftungen 12/6 pt, fett,
  linksbündig; Fußnoten 10 pt (Arial 9,5 pt) einzeilig, fortlaufend, Trennstrich;
  Blocksatz; Silbentrennung.
- **Seitenzahlen (1.2 Nr. 10):** in der Kopfzeile mittig (oder rechts); Titelblatt
  zählt als I ohne Nummer; Verzeichnisse römisch ab II; Textteil arabisch neu ab 1;
  Eigenständigkeitserklärung ohne Nummer und ohne ToC-Eintrag. Anhang +
  Literaturverzeichnis laufen arabisch weiter (so macht es der Leitfaden selbst).
- **Elementreihenfolge (1.1):** Titelblatt → Inhalts- → Abbildungs-/Tabellen-/
  Abkürzungsverzeichnis → ggf. Formel-/Symbolverzeichnis → ggf. Sperrvermerk →
  Textteil → ggf. Anhang → Literaturverzeichnis → ggf. Rechtsprechungs-/
  Quellenverzeichnis → KI-Hilfsmittelverzeichnis.
- **Zitieren (Kap. 3):** Chicago-Fußnote `Vgl. Nachname, V., Stichwort, Jahr, S. X.`
  (direktes Zitat ohne „Vgl.“) **oder** Harvard `(vgl. Nachname, Jahr, S. X)`.
  Ab 3 Autoren „et al./u. a.“ (nur im Kurzbeleg). Jahres-Suffixe a/b bei gleichem
  Autor+Jahr. „o. V.“/„o. J.“/„o. S.“ bei fehlenden Angaben.
- **Literaturverzeichnis (2.6):** `Nachname, Vorname (Stichwort, Jahr): Titel,
  N. Aufl., Ort: Verlag, Jahr` – kein Schlusspunkt, keine akademischen Titel,
  hängender Einzug ~1 cm, einzeilig, Abstand zwischen Einträgen; Internetquellen
  separat am Ende; Harvard: ohne Stichwort.
- **KI (1.6, 2.9):** lokaler Nachweis (System, Version, Zugriffsdatum) als Fußnote/
  Klammer + summarisches KI-Hilfsmittelverzeichnis als Bestandteil der Arbeit.

## Architektur

```
main.typ                        Nutzerkonfiguration + #include der Kapitel
template/fom.typ                fom-arbeit(...) – Show-Template, re-exportiert alle Helfer
template/styles.typ             ALLE Layout-Konstanten (einzige Stelle für Maße)
template/komponenten/
  titelblatt.typ                Anhang 3 (Seminararbeit) / Anhang 4 (Thesis)
  verzeichnisse.typ             ToC + Abbildungs-/Tabellen-/Formel-/Abkürzungs-/Symbolverz.
  abkuerzungen.typ              #abk() mit State-Tracking (1. Nutzung = Langform)
  zitieren.typ                  #vgl/#zit/#zitat, State "fom-zitierweise"
  elemente.typ                  #abbildung/#tabelle/#formel (Caption oben, Quelle unten)
  ki.typ                        #ki-nachweis + #ki-hilfsmittelverzeichnis
  erklaerungen.typ              Sperrvermerk + Eigenständigkeitserklärung (Wortlaut Anhang 8)
  nachspann.typ                 #anhang/#anhang-abschnitt/#literaturverzeichnis
template/csl/fom-chicago.csl    Kurzbeleg mit Stichwort + FOM-Bibliographie
template/csl/fom-harvard.csl    Autor-Jahr + FOM-Bibliographie ohne Stichwort
```

### Zentrale Design-Entscheidungen (bitte nicht ohne Grund ändern)

1. **Zeilenabstand-Kalibrierung:** Typst rechnet Grundlinienabstand = `leading` +
   Versalhöhe (TNR: 0,662 em). Word-1,5-zeilig ≈ 20,7 pt ⇒ `leading: 1.06em`
   (`styles.typ`). Empirisch per `measure()` verifiziert.
2. **Seitenzähler-Reset:** Bei `number-align: top` löst Typst die Seitenzahl **am
   Seitenanfang** auf – `counter(page).update(1)` nach dem Umbruch greift zu spät.
   Lösung in `fom.typ`: `counter(page).update(0)` **vor** `set page(numbering: "1")`
   (der Umbruch zählt dann auf 1).
3. **CSL-Klasse „in-text“ für beide Stile:** Auch Chicago ist als in-text-Stil
   definiert; die Fußnote samt „Vgl.“ und Schlusspunkt erzeugen die Helfer
   `#vgl`/`#zit`. So bleibt „Vgl.“ steuerbar (CSL kennt kein bedingtes Präfix) und
   es gibt keine verschachtelten Fußnoten. Konsequenz: bloßes `@key` erzeugt nur
   den nackten Kurzbeleg – dokumentiert, Helfer verwenden.
4. **Stichwort = `title-short`:** CSL `<text variable="title" form="short"/>` fällt
   automatisch auf den vollen Titel zurück, wenn `shorttitle` fehlt (Mendeley).
   Zotero/Better BibTeX exportiert das Zotero-Feld „Kurztitel“ als `shorttitle` –
   hayagriva mappt es korrekt (getestet).
5. **Internetquellen ans Ende:** über CSL-Sortier-Makro `typ-rang` (webpage → „2“).
   Eine echte Zwischenüberschrift „Internetquellen“ ist nicht möglich (Typst:
   eine Bibliographie pro Dokument) – dokumentierte Abweichung.
6. **Anhang-Nummern:** Zähler wird via `context` **in den Überschriftentext
   eingebrannt** (nicht `context display()` im Body), sonst zeigt das
   Inhaltsverzeichnis „Anhang 0“.
7. **Fonts:** Liberation Serif (SIL OFL) liegt in `fonts/` und ist Fallback in
   `styles.typ`; deshalb überall `--font-path fonts` (Makefile/Skripte/CI erledigen
   das). CI installiert zusätzlich ms-corefonts für echtes TNR und null Warnungen.
8. **Formel-Nummern:** eigene figure-kind `"fom-formel"`; die Nummer wird im Body
   per `counter(figure.where(kind: "fom-formel")).get()` gelesen (nach dem Step der
   Figure). `zusatz: "a"` dekrementiert den Zähler für Umformungen (1 → 1a).

## Build & Tests

```bash
make check    # kompiliert, Warnungen = Fehler (lokal wie in CI Pflicht vor Commit)
make build    # thesis.pdf
make watch    # Live-Vorschau
cd docs-app && npm run build   # Doku-Webseite (tsc + vite)
```

Visuelle Verifikation: `typst compile --font-path fonts --ppi 150 main.typ "seite-{0p}.png"`
und Seiten gegen den Leitfaden prüfen (Ränder, Kopfzeilen-Seitenzahl, Verzeichnisse).
Harvard-Regression: `sed 's/zitierweise: "chicago"/zitierweise: "harvard"/' main.typ`
in eine Testdatei und kompilieren.

## Bekannte Abweichungen / offene Punkte (Roadmap)

- [ ] Zwischenüberschrift „Internetquellen“ im Literaturverzeichnis (blockiert durch
      Typst: nur eine `bibliography` pro Dokument; Alternative: eigene Rendering-Schicht).
- [ ] Leerzeile zwischen Anfangsbuchstaben-Gruppen im Literaturverzeichnis (A → B).
- [ ] Ersetzungsstrich „–“ bei wiederholtem Verfasser (laut Leitfaden optional).
- [ ] Hängender Einzug exakt 1 cm (CSL/Typst rendert ~0,75 cm; fest verdrahtet).
- [ ] Jahres-Suffix-Vergabe folgt Zitier- statt Bibliographie-Reihenfolge (hayagriva);
      durch Weglassen des Titel-Sortierschlüssels praktisch korrekt.
- [ ] Rechtsprechungs-/Quellenverzeichnis als eigener Baustein (Leitfaden 2.7).
- [ ] `ebd.`-Automatik bei direkt aufeinanderfolgenden Zitaten (Leitfaden 3.2).

## Branch-Strategie

- `main`: Basis-Template + kompakte Beispielkapitel (jede Funktion einmal gezeigt).
- `example-thesis`: vollständige Musterarbeit (von main abgeleitet, nur `content/`
  und `main.typ` unterscheiden sich).
- `minimal`: Grundgerüst ohne Beispieltexte, ohne `docs-app/`.
- Template-Änderungen immer zuerst auf `main`, dann per Merge/Cherry-Pick in die
  anderen Branches nachziehen.

## Doku-Webseite (`docs-app/`)

Vite + React 19 + TypeScript + Tailwind 4 (`@tailwindcss/vite`). Kein Router-Paket:
Hash-Routing in `App.tsx` (funktioniert mit `base: "./"` überall, auf jedem Static-Host).
Seiten unter `src/inhalte/`, Bausteine unter `src/komponenten/` (CodeBlock mit
Kopieren-Button, Tabs für OS-Anleitungen, Callout, Seite mit Leitfaden-Eyebrow,
Satzspiegel-Hero). Design-Token in `src/index.css` (`@theme`): Papier/Tinte/Petrol.
Deployment: Cloudflare Workers (Static Assets, eigenständig konfiguriert – der
Build über `npm run build` → `dist/` bleibt unverändert).

## Stil-Konventionen

- Projektsprache Deutsch (Funktionsnamen, Parameter, Kommentare, Doku).
- Kommentare zitieren das jeweilige Leitfaden-Kapitel.
- Layout-Werte ausschließlich in `template/styles.typ`.
- Interne Symbole mit `_`-Präfix (z. B. `_zitierweise`), nicht re-exportieren.
