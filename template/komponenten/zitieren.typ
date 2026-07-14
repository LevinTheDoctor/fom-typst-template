// =============================================================================
// FOM-Template: Zitieren (Leitfaden Kapitel 3 "Zitieren")
// =============================================================================
// Der Leitfaden erlaubt zwei Zitierweisen (Leitfaden 3.2), die vorab gewählt
// und konsequent beibehalten werden müssen:
//
//   "chicago" (Standard): Kurzbeleg in der Fußnote
//       indirekt:  Vgl. Mayer, D., Finanzinvestitionen, 2019, S. 438.
//       direkt:    Mayer, D., Finanzinvestitionen, 2019, S. 438.
//
//   "harvard": Kurzbeleg in Klammern im Fließtext
//       indirekt:  (vgl. Mayer, 2019, S. 438)
//       direkt:    (Mayer, 2019, S. 438)
//
// Verwendung im Text:
//   #vgl(<mayer2019>, seite: "438")    -> indirektes Zitat
//   #zit(<mayer2019>, seite: "438")    -> direktes (wörtliches) Zitat
//   #zitat(<mayer2019>, seite: "438")  -> nur der Kurzbeleg (z. B. für eigene
//                                         Fußnoten mit mehreren Quellen)

#let _zitierweise = state("fom-zitierweise", "chicago")

// Wird vom Template beim Dokumentstart aufgerufen.
#let zitierweise-setze(stil) = {
  assert(stil in ("chicago", "harvard"), message: "zitierweise muss 'chicago' oder 'harvard' sein.")
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

// Indirektes Zitat ("Vgl."). Über `praefix` lässt sich z. B. "S. dazu"
// (entfernte Anlehnung, Leitfaden 3.2) setzen.
#let vgl(quelle, seite: none, praefix: "Vgl.") = context {
  if _zitierweise.get() == "chicago" {
    footnote[#praefix #zitat(quelle, seite: seite).]
  } else {
    [(#lower(praefix) #zitat(quelle, seite: seite))]
  }
}

// Direktes (wörtliches) Zitat – Kurzbeleg ohne "Vgl.".
#let zit(quelle, seite: none) = context {
  if _zitierweise.get() == "chicago" {
    footnote[#zitat(quelle, seite: seite).]
  } else {
    [(#zitat(quelle, seite: seite))]
  }
}
