#import "../template/fom.typ": *

= Empirische Befunde

Dieses Kapitel systematisiert die Befunde der Literaturanalyse. Zunächst
wird die Verbreitung des Homeoffice dargestellt, anschließend werden die
identifizierten Einflussfaktoren kategorisiert und diskutiert.

== Verbreitung des Homeoffice

Die in @abb-verbreitung dargestellte Entwicklung zeigt: Mit der Pandemie
hat sich der Anteil der Erwerbstätigen im Homeoffice nahezu verdoppelt und
verharrt seither auf hohem Niveau.#vgl(<destatis2024>, seite: "o. S.")

#abbildung(
  {
    // Einfaches, mit Typst gezeichnetes Balkendiagramm – in eigenen Arbeiten
    // stattdessen z. B.: image("abbildungen/verbreitung.png", width: 80%)
    let werte = (("2019", 12.9, "12,9 %"), ("2021", 24.9, "24,9 %"), ("2023", 23.5, "23,5 %"), ("2025", 24.5, "24,5 %"))
    box(
      inset: (top: 6pt),
      grid(
        columns: werte.len() * (52pt,),
        column-gutter: 14pt,
        align: center + bottom,
        row-gutter: 6pt,
        ..werte.map(((jahr, wert, beschriftung)) => box(
          width: 40pt,
          height: wert * 3.2pt,
          fill: rgb("#0a9086"),
          align(top + center, text(fill: white, size: 9pt)[#beschriftung]),
        )),
        ..werte.map(((jahr, ..rest)) => text(size: 10pt)[#jahr]),
      ),
    )
  },
  titel: [Anteil der Erwerbstätigen mit Arbeit im Homeoffice],
  quelle: [In Anlehnung an #zitat(<destatis2024>, seite: "o. S.")],
) <abb-verbreitung>

== Einflussfaktoren der Mitarbeiterzufriedenheit

Aus der Kodierung der Quellen ergeben sich vier zentrale Einflussfaktoren,
die @tab-faktoren mit Wirkungsrichtung und Evidenzlage zusammenfasst.

#tabelle(
  table(
    columns: (1.2fr, 1fr, 1fr),
    stroke: 0.5pt,
    inset: 6pt,
    align: left + horizon,
    table.header([*Einflussfaktor*], [*Wirkungsrichtung*], [*Evidenzlage*]),
    [Autonomie], [positiv], [hoch],
    [Soziale Isolation], [negativ], [mittel],
    [Technische Ausstattung], [positiv], [hoch],
    [Entgrenzung der Arbeitszeit], [negativ], [mittel],
  ),
  titel: [Einflussfaktoren der Mitarbeiterzufriedenheit im Homeoffice],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<scholz2014personal>, seite: "412")],
) <tab-faktoren>

Autonomie erweist sich als stärkster positiver Treiber: Beschäftigte, die
Arbeitszeit und -ort selbst gestalten können, berichten höhere
Zufriedenheitswerte. Dem stehen soziale Isolation und die Entgrenzung von
Arbeit und Privatleben als Risikofaktoren gegenüber – beide wirken vor
allem dann, wenn klare Regeln zur Erreichbarkeit fehlen.

== Diskussion

Der folgende Absatz wurde mit einer KI-Anwendung paraphrasiert und ist
entsprechend gekennzeichnet: Ortsflexibles Arbeiten kann die Zufriedenheit
der Beschäftigten erhöhen, sofern klare Regeln zur Erreichbarkeit bestehen
und die technische Ausstattung angemessen ist.#ki-nachweis(
  system: "ChatGPT",
  version: "4o",
  datum: "01.07.2026",
)

Im Licht des anreiztheoretischen Bezugsrahmens aus Kapitel 2.2 lassen sich
die Befunde konsistent deuten: Homeoffice wirkt nicht per se
zufriedenheitssteigernd, sondern nur, wenn die gebotenen Anreize – Autonomie
und Vertrauen – die Motivstruktur der Beschäftigten treffen und
Hygienefaktoren wie Technik und Erreichbarkeitsregeln gesichert
sind.#vgl(<scholz2014personal>, seite: "415")
