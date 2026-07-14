// =============================================================================
// FOM-Template: Nachspann – Anhang und Literaturverzeichnis
// (Leitfaden 2.6 und 2.8)
// =============================================================================

#import "../styles.typ": literatur-zeilenabstand, literatur-eintragsabstand
#import "zitieren.typ": _zitierweise

// Anhang (Leitfaden 2.8): eröffnet den Anhang mit unnummerierter Überschrift.
// Die Seitennummerierung läuft arabisch weiter (im Leitfaden ausdrücklich
// zugelassene Variante, die der Leitfaden selbst verwendet).
#let anhang(body, titel: "Anhang") = {
  pagebreak(weak: true)
  heading(level: 1, numbering: none, outlined: true, titel)
  body
}

// Einzelner Anhangsabschnitt: "Anhang 1: Verwendeter Fragebogen" usw.
// Die Bestandteile des Anhangs sind getrennt zu bezeichnen (Leitfaden 2.8).
#let _anhang-zaehler = counter("fom-anhang")
#let anhang-abschnitt(titel, body) = {
  _anhang-zaehler.step()
  // Die Nummer wird hier fest in den Überschriftentext übernommen, damit sie
  // auch im Inhaltsverzeichnis korrekt erscheint.
  context {
    let nummer = _anhang-zaehler.get().first()
    heading(level: 2, numbering: none, outlined: true)[Anhang #nummer: #titel]
  }
  body
}

// Literaturverzeichnis (Leitfaden 2.6).
//   - Format der Einträge über die mitgelieferten CSL-Stile
//     (template/csl/fom-chicago.csl bzw. fom-harvard.csl), passend zur in
//     main.typ gewählten Zitierweise.
//   - Einfacher Zeilenabstand innerhalb der Einträge, Abstand zwischen den
//     Einträgen, hängender Einzug ab der zweiten Zeile.
//   - Internetquellen werden automatisch ans Ende sortiert (Leitfaden 2.6:
//     "am Ende des Literaturverzeichnisses separat aufzuführen").
// `datei` kann ein einzelner Pfad oder eine Liste von Pfaden sein –
// Pfade mit führendem "/" beziehen sich auf das Projektverzeichnis.
#let literaturverzeichnis(
  datei: "/literatur/literatur.bib",
  titel: "Literaturverzeichnis",
  stil: auto,
) = {
  pagebreak(weak: true)
  heading(level: 1, numbering: none, outlined: true, titel)
  set par(justify: false, leading: literatur-zeilenabstand, spacing: literatur-eintragsabstand)
  context {
    let zitierweise = if stil == auto { _zitierweise.get() } else { stil }
    let csl = if zitierweise == "harvard" {
      "/template/csl/fom-harvard.csl"
    } else {
      "/template/csl/fom-chicago.csl"
    }
    bibliography(datei, title: none, style: csl)
  }
}
