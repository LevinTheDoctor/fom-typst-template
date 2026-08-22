// =============================================================================
// FOM-Template: Zitieren (Leitfaden Kapitel 3 "Zitieren")
// =============================================================================
// Der Leitfaden erlaubt zwei Zitierweisen (Leitfaden 3.2), die vorab gewählt
// und konsequent beibehalten werden müssen. Zusätzlich – nicht Teil des
// Leitfadens, aber als dritte Option ergänzt – steht "apa" (APA 7th Edition)
// zur Verfügung:
//
//   "chicago" (Standard): Kurzbeleg in der Fußnote
//       indirekt:  Vgl. Mayer, D., Finanzinvestitionen, 2019, S. 438.
//       direkt:    Mayer, D., Finanzinvestitionen, 2019, S. 438.
//
//   "harvard": Kurzbeleg in Klammern im Fließtext
//       indirekt:  (vgl. Mayer, 2019, S. 438)
//       direkt:    (Mayer, 2019, S. 438)
//
//   "apa": Kurzbeleg in Klammern im Fließtext (wie Harvard, aber "&" vor
//   dem letzten Verfasser und Literaturverzeichnis nach APA-7-Regeln)
//       indirekt:  (vgl. Mayer & Schmidt, 2019, S. 438)
//       direkt:    (Mayer & Schmidt, 2019, S. 438)
//
// Verwendung im Text:
//   #vgl(<mayer2019>, seite: "438")    -> indirektes Zitat
//   #zit(<mayer2019>, seite: "438")    -> direktes (wörtliches) Zitat
//   #zitat(<mayer2019>, seite: "438")  -> nur der Kurzbeleg (z. B. für eigene
//                                         Fußnoten mit mehreren Quellen)
//
// Für E-Book-Quellen ohne verlagsgetreue Seiten tritt `kap:` an die Stelle
// von `seite:` (Kapitel statt Seite):
//   #vgl-kap(<mayer2019>, kap: "3.2")  -> indirektes Zitat mit Kapitelangabe
//   #zit-kap(<mayer2019>, kap: "3.2")  -> direktes Zitat mit Kapitelangabe
//
// Sekundärzitate (Zitat aus zweiter Hand) kombinieren Original- und
// Sekundärquelle; `-nach-kap` deckt zusätzlich den Fall ab, dass eine der
// beiden Quellen (oder beide) keine Seitenzahlen hat – `seite`/`seite-sek`
// und `kap`/`kap-sek` lassen sich beliebig mischen:
//   #vgl-nach(<original>, <sekundaer>, seite: "12", seite-sek: "88")
//   #vgl-nach-kap(<original>, <sekundaer>, seite: "12", kap-sek: "5")
//   #vgl-nach-kap(<original>, <sekundaer>, kap: "2", kap-sek: "5")

#let _zitierweise = state("fom-zitierweise", "chicago")

// Wird vom Template beim Dokumentstart aufgerufen.
#let zitierweise-setze(stil) = {
  assert(stil in ("chicago", "harvard", "apa"), message: "zitierweise muss 'chicago', 'harvard' oder 'apa' sein.")
  _zitierweise.update(stil)
}

// Nackter Kurzbeleg (ohne Fußnote/Klammern) – Baustein für eigene Fußnoten:
//   #footnote[Vgl. #zitat(<a>, seite: "5"); #zitat(<b>, seite: "7").]
// Für Internetquellen ohne Seitenzahl: seite: "o. S." (Leitfaden 2.6).
#let zitat(quelle, seite: none) = {
  let zusatz = if seite == none {
    none
  } else if type(seite) == str and seite.starts-with("o.") {
    [#seite]
  } else {
    [S. #seite]
  }
  cite(quelle, supplement: zusatz)
}

// Nackter Kurzbeleg mit Kapitel- statt Seitenangabe – für E-Book-Quellen ohne
// verlagsgetreue Seiten; sonst identisch zu `zitat`.
#let zitat-kap(quelle, kap: none) = cite(quelle, supplement: [Kap. #kap])

// Interner Baustein: nimmt den fertigen Beleg und entscheidet Fußnote vs.
// Klammer. `praefix: none` = direktes Zitat (kein "Vgl."), sonst indirektes
// Zitat. Sowohl "harvard" als auch "apa" setzen den Kurzbeleg in Klammern im
// Fließtext; nur "chicago" verwendet Fußnoten. Gemeinsame Basis für alle
// vgl-/zit-Varianten (auch die Sekundärzitat- und Kapitel-Varianten).
#let _huelle(beleg, praefix) = context {
  if _zitierweise.get() == "chicago" {
    if praefix == none { footnote[#beleg.] } else { footnote[#praefix #beleg.] }
  } else {
    if praefix == none { [(#beleg)] } else { [(#lower(praefix) #beleg)] }
  }
}

// Indirektes Zitat ("Vgl."). Über `praefix` lässt sich z. B. "S. dazu"
// (entfernte Anlehnung, Leitfaden 3.2) setzen.
#let vgl(quelle, seite: none, praefix: "Vgl.") = _huelle(zitat(quelle, seite: seite), praefix)

// Direktes (wörtliches) Zitat – Kurzbeleg ohne "Vgl.".
#let zit(quelle, seite: none) = _huelle(zitat(quelle, seite: seite), none)

// Indirektes Zitat mit Kapitel- statt Seitenangabe (E-Book ohne Seiten).
#let vgl-kap(quelle, kap: none, praefix: "Vgl.") = _huelle(zitat-kap(quelle, kap: kap), praefix)

// Direktes Zitat mit Kapitel- statt Seitenangabe.
#let zit-kap(quelle, kap: none) = _huelle(zitat-kap(quelle, kap: kap), none)

// Nackter Kurzbeleg für Sekundärzitate – Baustein wie `zitat`.
// `original`   = die Quelle, aus der der Inhalt stammt
// `sekundaer`  = das Werk, in dem du sie gefunden hast
// `seite`      = Seite im Original, `seite-sek` = Seite in der Sekundärquelle
#let zitat-nach(original, sekundaer, seite: none, seite-sek: none) = [
  #zitat(original, seite: seite), zitiert nach #zitat(sekundaer, seite: seite-sek)
]

// Nackter Kurzbeleg für Sekundärzitate, bei denen Original und/oder
// Sekundärquelle keine Seitenzahlen haben – Kombination aus `zitat-nach` und
// `zitat-kap`. Pro Quelle wird `kap`/`kap-sek` verwendet, falls gesetzt,
// sonst `seite`/`seite-sek` (siehe `zitat`).
#let zitat-nach-kap(original, sekundaer, seite: none, kap: none, seite-sek: none, kap-sek: none) = {
  let beleg-original = if kap != none { zitat-kap(original, kap: kap) } else { zitat(original, seite: seite) }
  let beleg-sekundaer = if kap-sek != none {
    zitat-kap(sekundaer, kap: kap-sek)
  } else {
    zitat(sekundaer, seite: seite-sek)
  }
  [#beleg-original, zitiert nach #beleg-sekundaer]
}

// Indirektes Sekundärzitat: Vgl. Original, S. X, zitiert nach Sekundärquelle, S. Y.
#let vgl-nach(original, sekundaer, seite: none, seite-sek: none, praefix: "Vgl.") = {
  _huelle(zitat-nach(original, sekundaer, seite: seite, seite-sek: seite-sek), praefix)
}

// Direktes (wörtliches) Sekundärzitat – ohne "Vgl.".
#let zit-nach(original, sekundaer, seite: none, seite-sek: none) = {
  _huelle(zitat-nach(original, sekundaer, seite: seite, seite-sek: seite-sek), none)
}

// Indirektes Sekundärzitat, bei dem Original und/oder Sekundärquelle über
// Kapitel statt Seite belegt werden – Kombination aus `vgl-nach` und `vgl-kap`.
#let vgl-nach-kap(original, sekundaer, seite: none, kap: none, seite-sek: none, kap-sek: none, praefix: "Vgl.") = {
  _huelle(zitat-nach-kap(original, sekundaer, seite: seite, kap: kap, seite-sek: seite-sek, kap-sek: kap-sek), praefix)
}

// Direktes Sekundärzitat, bei dem Original und/oder Sekundärquelle über
// Kapitel statt Seite belegt werden.
#let zit-nach-kap(original, sekundaer, seite: none, kap: none, seite-sek: none, kap-sek: none) = {
  _huelle(zitat-nach-kap(original, sekundaer, seite: seite, kap: kap, seite-sek: seite-sek, kap-sek: kap-sek), none)
}
