// =============================================================================
// FOM-Template: Titelblatt (Leitfaden 2.1, Muster in Anhang 3 und 4)
// =============================================================================
// Zwei Varianten:
//   - Abschlussarbeit (Bachelor-/Master-Thesis) nach Anhang 4 – zentriert.
//     Hinweis des Leitfadens: Das offizielle Titelblatt für Abschlussarbeiten
//     wird von der FOM im Online-Campus bereitgestellt und kann dieses
//     Titelblatt ersetzen.
//   - Seminararbeit nach Anhang 3 – linksbündig, von Studierenden selbst
//     zu erstellen.
//
// Das FOM-Logo ist markenrechtlich geschützt und wird deshalb nicht
// mitgeliefert. Über den Parameter `logo` kann eine eigene Bilddatei
// eingebunden werden, z. B. logo: image("abbildungen/fom-logo.png", width: 3cm).

#let _datum-formatieren(datum) = {
  if type(datum) == datetime {
    datum.display("[day].[month].[year]")
  } else {
    datum
  }
}

// Titelblatt für Abschlussarbeiten (Anhang 4).
#let titelblatt-abschlussarbeit(
  hochschule: "FOM Hochschule für Oekonomie & Management",
  typ: "Bachelor-Thesis",
  studiengang: none,
  grad: none,
  titel: none,
  autor: none,
  erstgutachter: none,
  matrikelnummer: none,
  abgabedatum: none,
  logo: none,
) = {
  set align(center)
  set par(justify: false)

  if logo != none {
    logo
    v(1em)
  }
  text(size: 14pt, weight: "bold")[#hochschule]

  v(3.5em)
  text(weight: "bold")[#typ]
  if studiengang != none {
    linebreak()
    [im Studiengang #studiengang]
  }

  if grad != none {
    v(3em)
    [zur Erlangung des Grades eines]
    linebreak()
    text(size: 13pt)[#grad]
  }

  v(3em)
  [über das Thema]
  v(1em)
  block(text(size: 14pt, weight: "bold")[#titel])

  v(3.5em)
  [von]
  v(0.5em)
  block[#autor]

  v(1fr)
  align(left)[
    #grid(
      columns: (auto, auto),
      column-gutter: 2.5em,
      row-gutter: 1em,
      [Erstgutachter:], [#erstgutachter],
      [Matrikelnummer:], [#matrikelnummer],
      [Abgabedatum:], [#_datum-formatieren(abgabedatum)],
    )
  ]
  pagebreak()
}

// Titelblatt für Seminararbeiten (Anhang 3).
#let titelblatt-seminararbeit(
  hochschule: "FOM Hochschule für Oekonomie & Management",
  studiengang: none,
  semester: none,
  modul: none,
  titel: none,
  autor: none,
  betreuer: none,
  matrikelnummer: none,
  abgabedatum: none,
  logo: none,
) = {
  set align(left)
  set par(justify: false)

  if logo != none {
    logo
    v(1.5em)
  }
  [#hochschule]

  v(2.5em)
  if studiengang != none {
    [Berufsbegleitender Studiengang zum]
    linebreak()
    [#studiengang]
  }

  if semester != none {
    v(2.5em)
    [#semester. Semester]
  }

  v(5em)
  [Seminararbeit#if modul != none [ in #modul]]

  v(3em)
  block(text(weight: "bold")[#titel])

  v(1fr)
  grid(
    columns: (auto, auto),
    column-gutter: 2.5em,
    row-gutter: 1em,
    [Betreuer(in):], [#betreuer],
    [Autor(in):], [#autor],
    [Matrikelnr.:], [#matrikelnummer],
    [Abgabedatum:], [#_datum-formatieren(abgabedatum)],
  )
  pagebreak()
}
