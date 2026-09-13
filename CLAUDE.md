# CLAUDE.md – Projektwissen für KI-gestützte Weiterentwicklung

Dieses Dokument beschreibt Architektur, Entscheidungen und Erweiterungspunkte des
FOM-Typst-Templates, damit spätere Sessions (oder andere Mitwirkende) nahtlos
weiterarbeiten können.

## Was dieses Repository ist

Ein GitHub-Template-Repository für wissenschaftliche Arbeiten an der FOM Hochschule
auf Basis von **Typst** (getestet mit Typst 0.15). Es setzt den *Leitfaden zur
formalen Gestaltung von Seminar- und Abschlussarbeiten* (Stand Januar 2024) um. Die
Quell-PDF (`2024_Leitfaden-WManagement-GuS-WRecht.pdf`, 73 Seiten) liegt aus
urheberrechtlichen Gründen nicht im Repository; sie ist im FOM Online-Campus
verfügbar.

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
  Autor+Jahr. „o. V.“/„o. J.“/„o. S.“ bei fehlenden Angaben. „ebd.“ bei
  unmittelbar wiederholtem Beleg (Leitfaden 3.2).
- **Literaturverzeichnis (2.6):** `Nachname, Vorname (Stichwort, Jahr): Titel,
  N. Aufl., Ort: Verlag, Jahr` – kein Schlusspunkt, keine akademischen Titel,
  hängender Einzug ~1 cm, einzeilig, Abstand zwischen Einträgen; Internetquellen
  separat am Ende; Harvard: ohne Stichwort.
- **KI (1.6, 2.9):** lokaler Nachweis (System, Version, Zugriffsdatum) als Fußnote/
  Klammer + summarisches KI-Hilfsmittelverzeichnis (mit Datum der Kommunikation)
  als Bestandteil der Arbeit.

## Architektur

```
main.typ                        Nutzerkonfiguration + #include der Kapitel (+ wordometer)
template/fom.typ                fom-arbeit(...) – Show-Template, re-exportiert alle Helfer
template/styles.typ             ALLE Layout-Konstanten (einzige Stelle für Maße)
template/komponenten/
  titelblatt.typ                Anhang 3 (Seminararbeit) / Anhang 4 (Thesis); Wortanzahl-Zeile
  verzeichnisse.typ             ToC + Abbildungs-/Tabellen-/Formel-/Abkürzungs-/Symbolverz.
  abkuerzungen.typ              #abk() mit State-Tracking (1. Nutzung = Langform)
  zitieren.typ                  #vgl/#zit/#zitat + *-kap/*-nach + ebd.-Automatik + punkt:
  elemente.typ                  #abbildung/#tabelle/#formel (Caption oben, Quelle unten)
  ki.typ                        #ki-nachweis + #ki-hilfsmittelverzeichnis (mit Datum-Spalte)
  erklaerungen.typ              Sperrvermerk + Eigenständigkeitserklärung (Wortlaut Anhang 8)
  nachspann.typ                 #anhang/#anhang-abschnitt/#literaturverzeichnis
                                (internetquellen:, zusaetzlich:)
template/csl/fom-chicago.csl    Kurzbeleg mit Stichwort + FOM-Bibliographie (Autoren kursiv)
template/csl/fom-harvard.csl    Autor-Jahr + FOM-Bibliographie ohne Stichwort (Autoren kursiv)
template/csl/fom-apa.csl        Autor-Jahr nach APA 7 (zusätzlich, NICHT Leitfaden)
```

### Zentrale Design-Entscheidungen (bitte nicht ohne Grund ändern)

1. **Zeilenabstand-Kalibrierung:** Typst rechnet Grundlinienabstand = `leading` +
   Versalhöhe (TNR: 0,662 em). Word-1,5-zeilig ≈ 20,7 pt ⇒ `leading: 1.06em`
   (`styles.typ`). Empirisch per `measure()` verifiziert.
2. **Seitenzähler-Reset:** Bei `number-align: top` löst Typst die Seitenzahl **am
   Seitenanfang** auf – `counter(page).update(1)` nach dem Umbruch greift zu spät.
   Lösung in `fom.typ`: `counter(page).update(0)` **vor** `set page(numbering: "1")`
   (der Umbruch zählt dann auf 1).
3. **CSL-Klasse „in-text“ für alle Stile:** Auch Chicago ist als in-text-Stil
   definiert; die Fußnote samt „Vgl.“ und Schlusspunkt erzeugen die Helfer
   `#vgl`/`#zit`. So bleibt „Vgl.“ steuerbar (CSL kennt kein bedingtes Präfix) und
   es gibt keine verschachtelten Fußnoten. Konsequenz: bloßes `@key` erzeugt nur
   den nackten Kurzbeleg – dokumentiert, Helfer verwenden.
   **APA (`zitierweise: "apa"`, `fom-apa.csl`)** ist eine dritte, optionale
   Zitierweise außerhalb des Leitfadens (der nur Chicago/Harvard zulässt). Sie
   verhält sich technisch wie Harvard (Klammerbeleg im Text, `else`-Zweig in
   `#vgl`/`#zit`/`#ki-nachweis`), folgt aber APA 7: Klammer-Jahr direkt hinter
   den Verfassern, kursive Werktitel, „&“ vor dem letzten Verfasser, kein
   Verlagsort, DOI/URL am Eintragsende, Vornamen nur als Initialen und keine
   Sonder-Sortierung der Internetquellen ans Ende.
4. **Stichwort = `title-short`:** CSL `<text variable="title" form="short"/>` fällt
   automatisch auf den vollen Titel zurück, wenn `shorttitle` fehlt (Mendeley).
   Zotero/Better BibTeX exportiert das Zotero-Feld „Kurztitel“ als `shorttitle` –
   hayagriva mappt es korrekt (getestet).
5. **Internetquellen ans Ende – zwei Wege:** a) ohne `internetquellen`-Parameter
   sortiert das CSL-Sortier-Makro `typ-rang` (webpage → „2“) Internetquellen
   geschlossen ans Ende (ohne Überschrift); b) mit
   `internetquellen: "/literatur/internetquellen.bib"` entsteht ein eigener
   Abschnitt mit Zwischenüberschrift „Internetquellen“ (`outlined: false`, also
   ohne eigenen Inhaltsverzeichnis-Eintrag) – seit Typst 0.15 sind mehrere
   `bibliography`-Aufrufe erlaubt; ein Schlüssel darf nicht in beiden Dateien
   liegen.
6. **Anhang-Nummern:** Zähler wird via `context` **in den Überschriftentext
   eingebrannt** (nicht `context display()` im Body), sonst zeigt das
   Inhaltsverzeichnis „Anhang 0“.
7. **Fonts:** Liberation Serif (SIL OFL) liegt in `fonts/` und ist Fallback in
   `styles.typ`; deshalb überall `--font-path fonts` (Makefile/Skripte/CI erledigen
   das). CI installiert zusätzlich ms-corefonts für echtes TNR und null Warnungen.
8. **Formel-Nummern:** eigene figure-kind `"fom-formel"`; die Nummer wird im Body
   per `counter(figure.where(kind: "fom-formel")).get()` gelesen (nach dem Step der
   Figure). `zusatz: "a"` dekrementiert den Zähler für Umformungen (1 → 1a).
9. **Titelblatt papiermittig:** Der Satzspiegel ist asymmetrisch (links 4 cm,
   rechts 2 cm) – „zentriert“ läge sonst 1 cm rechts der Blattmitte. Der
   zentrierte Teil beider Titelblätter steckt deshalb in `pad(right: 2cm)`
   (`titelblatt.typ`); der Datenblock unten bleibt am linken Textrand.
10. **ebd.-Automatik (Leitfaden 3.2):** `zitieren.typ` merkt sich über den State
    `fom-letzter-beleg` den letzten Einzelbeleg und ersetzt unmittelbare
    Wiederholungen durch „ebd.“ (abweichende Seite bleibt: „ebd., S. 440“). Jede
    Fußnote unterbricht die Kette (`show footnote: kette-unterbrechen` in
    `fom.typ`), sodass sich „ebd.“ immer auf die unmittelbar vorangehende
    Fußnote bezieht. **Konvergenz-Falle:** Der State darf ausschließlich im
    Fließtext (nicht im Fußnotenkörper, nicht umbruchabhängig) fortgeschrieben
    werden, sonst „document did not converge“. Abschaltbar dokumentweit über
    `fom-arbeit(ebd: false)` oder einzeln über `#vgl(..., ebd: false)`.
11. **Wortzählung (wordometer):** `main.typ` umschließt die Kapitel mit
    `#word-count(..., exclude: (footnote, figure, table))` und legt die Zahl in
    der Metadaten-Marke `<word-count>` ab. Das Titelblatt liest sie bei
    `wortanzahl: auto` per `query(<word-count>)` (Zeile entfällt, wenn keine Marke
    existiert); `make wordcount`/`make build` geben sie in der Konsole aus, die CI
    schreibt sie ins Step-Summary. **Bekannte Falle:** context-basiertes `#abk()`
    wird von wordometer nicht mitgezählt (Wörter fehlen) – im Zweifel Kürzel als
    Literaltext schreiben. `semester` als Titelblatt-Parameter wurde durch
    `studienzentrum` ersetzt (Breaking Change zur Seminararbeit-Optik).
12. **CSL-Feinheiten:** Autorennamen im Literaturverzeichnis kursiv (nur
    Chicago/Harvard, nicht APA); `note`-Feld als freie Anmerkung (Makro
    `anmerkung`, „– E-Book-Ausgabe“); `genre` überschreibt das Seiten-Label
    „S.“ (Art.-Nr. bei MDPI-Journalen); Datums-Teil-Prefixe statt `delimiter`
    (verhindert „(2022-)“ bei nur-Jahres-Quellen).

## Build & Tests

```bash
make check    # kompiliert, Warnungen = Fehler (lokal wie in CI Pflicht vor Commit)
make build    # thesis.pdf + Wortzahl
make watch    # Live-Vorschau
make wordcount # nur die Wortzahl des Textteils auslesen
```
(Die Doku-Webseite `docs-app/` liegt nur auf `webapp` – dieser Branch ist das
Grundgerüst ohne Beispieltexte und ohne Web-Doku.)

Visuelle Verifikation: `typst compile --font-path fonts --ppi 150 main.typ "seite-{0p}.png"`
und Seiten gegen den Leitfaden prüfen (Ränder, Kopfzeilen-Seitenzahl, Verzeichnisse).
Harvard/APA-Regression: `sed 's/zitierweise: "chicago"/zitierweise: "harvard"/' main.typ`
in eine Testdatei und kompilieren (analog `"apa"`).

## Bekannte Abweichungen / offene Punkte (Roadmap)

- [ ] Leerzeile zwischen Anfangsbuchstaben-Gruppen im Literaturverzeichnis (A → B).
- [ ] Ersetzungsstrich „–“ bei wiederholtem Verfasser (laut Leitfaden optional).
- [ ] Hängender Einzug exakt 1 cm (CSL/Typst rendert ~0,75 cm; fest verdrahtet).
- [ ] Jahres-Suffix-Vergabe folgt Zitier- statt Bibliographie-Reihenfolge (hayagriva);
      durch Weglassen des Titel-Sortierschlüssels praktisch korrekt.
- [ ] Rechtsprechungs-/Quellenverzeichnis als eigener Baustein (Leitfaden 2.7).

## Branch-Strategie

- `main`: leeres Grundgerüst ohne Beispieltexte, ohne `docs-app/` – **GitHub-Default-
  Branch** (Klonen bzw. „Use this template“ liefert das leere Grundgerüst).
- `webapp`: Basis-Template mit kompakten Beispielkapiteln (jede Funktion einmal
  gezeigt) + `docs-app/` – hier findet die Entwicklung statt.
- `example-seminararbeit`: vollständig ausgefüllte, abgegebene Seminararbeit
  („Project Cybersyn“) als Praxisbeispiel (eigene Historie aus dem Arbeits-Repo).
- Template-Änderungen immer zuerst auf `webapp`, dann per Merge/Cherry-Pick in die
  anderen Branches nachziehen.
- Die CI committet nach jedem Push das gebaute `thesis.pdf` in den jeweiligen
  Branch (github-actions[bot], `[skip ci]`; `paths-ignore` verhindert Schleifen)
  und schreibt die Wortzahl des Textteils ins Step-Summary. Vor lokalen
  Folge-Arbeiten daher `git pull`. Merge-Konflikte in `thesis.pdf` mit beliebiger
  Seite auflösen (z. B. `git checkout --ours thesis.pdf`) – die CI baut nach dem
  Push ohnehin neu.

## Doku-Webseite (`docs-app/`)

Lieg**t nur auf dem Branch `webapp`** – dieser Branch (`main`) ist das Grundgerüst
ohne Beispieltexte und ohne Web-Doku. Details (Stack, Bausteine, Deployment):
siehe `webapp`-Variante dieser Datei bzw. `docs-app/README.md` dort.

## Stil-Konventionen

- Projektsprache Deutsch (Funktionsnamen, Parameter, Kommentare, Doku).
- Kommentare zitieren das jeweilige Leitfaden-Kapitel.
- Layout-Werte ausschließlich in `template/styles.typ`.
- Interne Symbole mit `_`-Präfix (z. B. `_zitierweise`), nicht re-exportieren.
