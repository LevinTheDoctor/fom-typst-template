#import "../template/fom.typ": *
= Das Cybersyn-Projekt
Die Entwicklung des Cybersyn-Projekts war der Versuch, Allendes Politik mithilfe des #abk("VSM") und der Management-Kybernetik in einem technischen System abzubilden.#vgl(<espejoCybersynBigData2022>, seite: 1163) Beides wird in diesem Kapitel erörtert.
#abbildung(
  align(center, image("../abbildungen/zeitstarhl.png", width: 75%)),
  titel: [Verlauf des Cybersyn-Projekts],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<medinaCyberneticRevolutinaries2014>) und #zitat(<espejoCybersynBigData2022>, seite: 1166)],
)<abb-zeitstarhl>
== Allendes Politik
Allende war Sozialist mit dem Ziel, die Industrie multinationaler Konzerne und der chilenischen Oligarchie zu verstaatlichen,#vgl(<bildung1970SalvadorAllende2015>) Chile durch Reformen in einen sozialistischen Staat umzuwandeln und alle demokratischen Institutionen zu erhalten. Dieser Ansatz wurde als „chilenischer Weg zum Sozialismus“ bekannt. Die #abk("USA") sowie die Opposition Allendes waren mit seinem Kurs nicht zufrieden. Dies führte zu den Streiks gegen die Regierung sowie dem späteren Militärputsch und dem Ende Cybersyns durch den Regierungswechsel (@abb-zeitstarhl). #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production")
=== Umsetzung der Verstaatlichung
Durch die Verstaatlichung stand die Regierung vor der Aufgabe, die Unternehmen samt ihrer Mitarbeiter*innen zu steuern. Die Aufgabe wurde von der #abk("CORFO"), der chilenischen Staatsentwicklungsbehörde, übernommen.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
#abbildung(
  align(center, image("../abbildungen/CORFO-Hierachie2.png", width: 100%)),
  titel: [Hierarchie der Verstaatlichung durch die CORFO vor Cybersyn],
  quelle: [Eigene Darstellung in Anlehnung an #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production")],
)<abb-hCvCnsy>
Die #abk("CORFO") unterteilte die Wirtschaft in vier Zweige mit untergeordneten Sektoren (@abb-hCvCnsy). #emph()[Interventoren] ersetzten die bisherigen Eigentümer und Manager und überwachten die Unternehmen der Sektoren.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production") Weder Komitees noch Interventoren hatten klare Rollen. Zudem gab es zu wenige qualifizierte Interventoren für bestimmte Sektoren.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production") Deshalb kam #emph()[Fernando Flores] auf die Idee, #emph()[Stafford Beer] zu kontaktieren, um die Steuerung der chilenischen Wirtschaft durch Management-Kybernetik zu erleichtern.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism") Beer nahm die Einladung an, da er so seine Ideen auf nationaler Ebene testen konnte.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
== Anwendung des VSM auf die chilenische Wirtschaft
Beer hatte das #abk("VSM") bereits bei seinem ersten Besuch entwickelt und gab den Mitarbeiter*innen am Projekt die Manuskripte für #emph()[Brain of the Firm].#vgl(<brain-of-the-firm>, seite: 248)
#abbildung(
  align(center, image("../abbildungen/VSM-Rekursion-Beer.png", height: 71%)),
  titel: [VSM-Rekursion nach Beer: Anwendung auf den chilenischen Staat],
  quelle: [Eigene Darstellung in Anlehnung an Auszüge aus Beers Bericht #emph()[Cybernetic Notes on the Effective Organisation of the State with Particular Reference to Industrial Control] #zitat(<brain-of-the-firm>, seite: 249)],
)<abb-beer-chile-mappin>
Während seines ersten Besuchs beschäftigte sich Beer damit, wie der chilenische Staat im #abk("VSM") abgebildet werden könnte (@abb-beer-chile-mappin). Zusätzlich entwarf Beer einen Plan, der drei der vier später realisierten Komponenten beinhaltete.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
== Technische Umsetzung Cybersyns
Bei seinem ersten Entwurf plante Beer die Komponenten Cyberstride, CHECO und Cybernet.#footnote[Beer hat bei dem Projekt einen Großteil der Planung der Komponenten Cybersyns übernommen, sowie die theoretische Grundlage mit dem #abk("VSM") geliefert. Allerdings sollte ihm das Projekt nicht vollständig zugeschrieben werden, da die Implementierung der Komponenten von anderen übernommen wurde. Cyberstride wurde von der #abk("ECOM") und dem Londoner Büro der US-amerikanischen Unternehmensberatung Arthur Andersen übernommen. Vgl. #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network"). CHECO wurde von Ron Anderton und Mario Grandi entwickelt. Vgl. #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network"). Der Operationsraum wurde von #abk("INTEC") unter der Leitung von #emph[Gui Bonsiepe] entworfen. Vgl. #zitat(<brain-of-the-firm>, seite: 268). Die Projektleitung übernahm Raúl Espejo. Vgl. #zitat(<espejoCybersynBigData2022>). Da der Fokus der Arbeit aber auf die Funktion und Theorie hinter dem Projekt eingeht, findet es später wenig Erwähnung.] Hinzu kam der Operationsraum.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network") Dieser war als futuristische Vision geplant, blieb aber wegen technischer Limitationen ein Prototyp.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine")
#tabelle(
  table(
    columns: 2,
    table.header([Komponente], [Funktion]),
    [Cyberstride],
    [Statistik-Software, die basierend auf Produktionsdaten System 1-3 überwacht und bei Abweichungen algedonische Signale an System 4 und 5 sendet. So konnte auf Ereignisse wie Rohmaterialknappheit besser reagiert werden, da Komitees die Interventoren gezielter beraten und Probleme leichter identifizieren konnten.#vgl(<brain-of-the-firm>, seite: 261) ],

    [CHECO],
    [#abk("CHECO") war eine Simulation der chilenischen Wirtschaft, die der Regierung als Labor zur Prognose von Entscheidungsauswirkungen dienen sollte. Für Beer war es eine Implementierung des Systems 4.#vgl(<brain-of-the-firm>, seite: 266)],

    [Cybernet],
    [Cybernet war ein Netzwerk, das die verschiedenen Unternehmen verbinden sollte, und bildete das Rückgrat des Projekts: Es sendete die Daten an die Programme und ermöglichte die Kommunikation auf unterschiedlichen Ebenen.],

    [Der Operationsraum],
    [Der Operationsraum sollte die anderen Komponenten miteinander verbinden, indem die Daten, die diese lieferten, auf einen Blick verfügbar waren. Der Raum war explizit auf Arbeiter*innen ausgelegt.],
  ),
  titel: [Komponenten Cybersyns],
  quelle: [Eigene Darstellung basierend auf #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")],
)<tab-komp>
@tab-komp zeigt die Komponenten Cybersyns.
\ Für die CHECO lehnte Beer die Input-Output-Analyse ab, da er sie als strukturarm empfand und große Datenmengen benötigte, die innerhalb der Projektfrist nicht zu beschaffen waren.#vgl(<brain-of-the-firm>, seite: 265) Beer nutzte deshalb die Sprache DYNAMO.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
\ Cybernet war zunächst nur ein Spitzname des Projektteams für das Netzwerk.#vgl(<brain-of-the-firm>, seite: 252) Da in Chile zu wenige Computer vorhanden waren, griff man stattdessen auf Telex-Maschinen zurück – kurz für #emph()[Teleprinter Exchange]: Fernschreiber mit eindeutiger Nummer, die ans Telefonnetz angeschlossen waren.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#abbildung(
  align(center, image("../abbildungen/Telex-Aufbau.png", width: 75%)),
  titel: [Einsatz des Telexnetzwerks zum Austausch von Informationen],
  quelle: [Eigene Darstellung in Anlehnung an #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")],
)<abb-telex-aufbau>
@abb-telex-aufbau zeigt den Ablauf der Kommunikation über Cybernet, darunter die Funktion von Cyberstride (@tab-komp): die Benachrichtigung der #abk("CORFO") bei Ausnahmen. Die statistischen Berichte erschwerten es Interventoren, Produktionsdaten zu fälschen.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#abbildung(
  align(center, image("../abbildungen/Ops-Room.png", height: 75%)),
  titel: [Aufbau des Operationsraums],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>, seite: 269) und Gebäudeplan aus #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine")],
)<abb-opsroom>
@abb-opsroom zeigt das Design des Raums.
#tabelle(
  table(
    columns: 3,
    table.header([Gerät], [Aufbau], [Aufgabe]),
    [Animiertes #abk("VSM")],
    [Ein zwei Meter hoher Schrank, in dem rotierende Polarisationsscheiben – eine Möglichkeit für mechanische Animation – das #abk("VSM") an eine Wand im Schrank projizierten, sodass es von außen sichtbar war.],
    [Die Polarisationsscheiben konnten beschriftet werden, die Beschriftung wurde für jede Besprechung angepasst, sodass man das aktuelle Mapping des #abk("VSM") sehen konnte.],

    [Alarmbildschirme],
    [Zwei Bildschirme, die von Hand bedient werden mussten.],
    [Die Alarmbildschirme zeigten Warnungen für System 3, 4 und 5, falls Abweichungen eintraten.],

    [Algedonische Warnleuchte],
    [Das Signal wurde durch Blinken zweier roter Leuchten angezeigt.],
    [Die Lampen leuchteten, wenn ein algedonisches Signal aus Cyberstride über Cybernet übermittelt wurde.],

    [Datafeed-Anzeigen],
    [Der Datafeed bestand aus drei Bildschirmen mit je fünf Rückprojektoren, die das Flackern eines ruhenden Bildschirms vermeiden sollten, und einem weiteren, nur von einem Rückprojektor betriebenen Bildschirm für eine Legende der Elemente.],
    [Der Datafeed zeigte Daten aus dem Cyberstride-Programm, die über die Kontrollen der Stühle navigiert werden konnten.],

    [Panel of the Future],
    [Das Panel of the Future war eine in Stoff gehüllte Magnetwand mit unterschiedlichen Magneten, die jeweils einen Teil der Wirtschaft darstellten.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine") ],
    [Mit ihr sollte geprüft werden, ob eine Entscheidung sich positiv oder negativ auf die Wirtschaft auswirkt – so ließen sich Ideen auch ohne Rechner leicht testen.],
  ),
  titel: [Bestandteile des Operationsraums],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>, seite: "268–270") und #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine")],
) <tab-opsroom-aufbau>
@tab-opsroom-aufbau schlüsselt die Bestandteile des Operationsraums auf. Der Aufbau der Geräte (@tab-opsroom-aufbau) zeigt, dass der Raum ein Prototyp blieb. Ein Beispiel ist das #emph()[Panel of the Future], das ursprünglich eine Simulation durch CHECO zeigen sollte – der dafür nötige Computer wurde jedoch nie fertiggestellt.#vgl(<brain-of-the-firm>, seite: 270)
\ Die Stühle waren um die Mitte des Raums so angeordnet, dass von jedem aus alles zu sehen war. Das Bedienfeld war explizit auf Arbeiter*innen zugeschnitten; die Steuerung sollte leicht bedienbar und robust sein. Beer nannte sie #emph()[Big Hand Control].#vgl(<brain-of-the-firm>, seite: 270)
\ Eine weitere Komponente war Cyberfolk: ein Rückkanal, über den die Bevölkerung per Regler algedonische Signale an die Regierung senden sollte. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#abbildung(
  align(center, image("../abbildungen/cyberfolk.png", height: 75%)),
  titel: [Beers Plan für Projekt Cyberfolk],
  quelle: [Eigene Darstellung in Anlehnung an Zeichnung von Beer aus  #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")],
)<abb-cyberfolk>
@abb-cyberfolk zeigt, wie Beer sich die Partizipation der Bevölkerung vorstellte. Die Abstimmungen sollten anonym bleiben, damit die Regierung unzufriedene Personen nicht unterdrücken konnte.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
== Anwendung während des Oktoberstreiks
Der Oktoberstreik, ein Streik der #abk("LKW")-Fahrer, gefährdete die Grundversorgung – insbesondere Nahrungsmittel, Rohmaterialien und Treibstoff.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike") Da der Regierung dadurch der Machtverlust drohte, setzte sie das Militär ein, wodurch einige Fabriken weiterarbeiten konnten.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike") Die Produktion lief zwar weiter, doch blieb es schwierig, die verbliebenen Fabriken zu koordinieren. #emph()[Mario Grandi], der Leiter des CHECO-Teams, und Flores kamen daher auf die Idee, dafür Cybernet zu nutzen und so die Grundversorgung zu sichern.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike") Dazu wurden eine zentrale Kommandozentrale im Präsidentenpalast und spezialisierte Kommandozentralen für Transport, Industrie, Energie, Banken, Landwirtschaft, Gesundheit und Güterversorgung errichtet, die über Cybernet verbunden waren und tagesaktuelle Daten lieferten. So flossen Informationen direkt nach oben und Befehle direkt nach unten, wodurch es nie zum Produktionsstopp kam.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike") Die Regierung konnte den Streik zwar nicht unterdrücken, doch da auch die Streikenden keinen Produktionsstopp erreichten, kam es zum Patt (@abb-zeitstarhl): Der Streik endete, Allende blieb Präsident, und General Carlos Prats wurde als Innenminister sein Stellvertreter. Um einen Konflikt mit dem Militär zu vermeiden, stimmten die Streikenden dem zu.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike")
== Ende des Projekts
Das Ende des Projekts begann mit einem zweiten #abk("LKW")-Streik. Bei dem Streik wurde Cybernet wieder verwendet, doch dieses Mal waren die Proteste gewaltsamer.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "6 Cybersyn Goes Public") Am 3. September 1973 veröffentlichte die rechte chilenische Zeitung #emph()[Qué Pasa] einen Artikel, der Cybersyn als Kontrollwaffe der Regierung darstellte.#vgl-nach-kap(<quepasa1973cyberstride>, <medinaCyberneticRevolutinaries2014>, kap-sek: "6 Cybersyn Goes Public") Der Artikel hatte das Ziel, Misstrauen zu schüren und öffentliche Unterstützung für einen Militärputsch zu erzeugen.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "6 Cybersyn Goes Public") Der Militärputsch fand am 11. September 1973 statt. Bei dem Putsch kam Allende ums Leben, Flores wurde verhaftet und das Militär übernahm die Regierung.#vgl-nach-kap(<guzman2004salvador>, <medinaCyberneticRevolutinaries2014>, kap-sek: "6 Cybersyn Goes Public") Nachdem das Militär an die Macht gekommen war, wurde nicht mehr an dem Projekt gearbeitet und die meisten Dokumente und Gegenstände des Projekts wurden zerstört.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "7 Conclusion: Technology, Politics, History")

