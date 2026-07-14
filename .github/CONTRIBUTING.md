# Mitwirken am FOM-Typst-Template

Danke für dein Interesse! Dieses Template lebt davon, dass Studierende und Lehrende
Abweichungen vom Leitfaden melden und Verbesserungen beisteuern.

## Womit du helfen kannst

- **Leitfaden-Abgleich:** Du hast eine Stelle gefunden, an der das erzeugte PDF vom
  FOM-Leitfaden abweicht? Bitte als Issue melden – idealerweise mit Verweis auf das
  Leitfaden-Kapitel und einem Screenshot.
- **Leitfaden-Updates:** Erscheint eine neue Fassung des Leitfadens, sind Issues mit
  einer Liste der Änderungen Gold wert.
- **Dokumentation:** Unklare Anleitungen in `/docs-app` verständlicher machen.
- **Code:** Neue Bausteine (z. B. Rechtsprechungsverzeichnis), Bugfixes, CI-Verbesserungen.

## Entwicklung einrichten

```bash
git clone https://github.com/DEIN-BENUTZERNAME/fom-typst-template.git
cd fom-typst-template

make check      # Template kompilieren, Warnungen = Fehler
make docs-dev   # Doku-Webseite lokal starten
```

Alternativ öffnet der mitgelieferte Dev-Container (`.devcontainer/`) eine fertige
Umgebung mit Typst, Node.js und VS-Code-Erweiterungen.

## Leitplanken

1. **Der Leitfaden ist die Spezifikation.** Jede Layout-Regel im Code verweist im
   Kommentar auf das Leitfaden-Kapitel (z. B. „Leitfaden 1.2 Nr. 9“). Bitte bei
   Änderungen beibehalten.
2. **Deutsch als Projektsprache.** Benutzerseitige Funktionen, Parameter, Kommentare
   und Doku sind deutsch – die Zielgruppe sind FOM-Studierende.
3. **Zentrale Konstanten.** Layout-Werte gehören nach `template/styles.typ`, nicht
   verstreut in Komponenten.
4. **Zero-Config bewahren.** Neue Funktionen brauchen sinnvolle Standardwerte; die
   Basisnutzung darf nicht komplizierter werden.
5. **Vor dem PR:** `make check` muss ohne Warnungen durchlaufen, bei Änderungen an
   der Doku-Webseite zusätzlich `cd docs-app && npm run build`.

## Pull-Request-Ablauf

1. Fork erstellen und Feature-Branch anlegen (`git switch -c fix/literatur-sortierung`).
2. Änderung umsetzen, `make check` ausführen.
3. PR gegen `main` öffnen und kurz beschreiben: Was ändert sich, welches
   Leitfaden-Kapitel ist betroffen, wie wurde getestet?
4. Änderungen, die auch `example-thesis` oder `minimal` betreffen, bitte im PR
   erwähnen – die Branches werden nach dem Merge nachgezogen.

## Verhaltenskodex

Freundlich, konstruktiv, hilfsbereit – wie in einer guten Lerngruppe. Melde
inakzeptables Verhalten an die Maintainer.
