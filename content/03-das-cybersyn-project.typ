#import "../template/fom.typ": *
= Das Cybersyn-Projekt
In diesem Kapitel wird Cybersyn tiefer behandelt. Erst wird der historische Kontext dargestellt. Daraufhin wird der technische Aufbau Cybersyns erläutert sowie, wie Cybersyn genutzt wurde. Zum Abschluss des Kapitels wird aufgezeigt, wie das Projekt abrupt geendet ist.
== Historischer Hintergrund und Rahmenbedingungen
Bei der Präsidentschaftswahl am 4. September 1970 in Chile gewann die #abk("UP") mit dem Kandidaten #emph()[Salvador Allende]#vgl(<bildung1970SalvadorAllende2015>). Allende war ein Sozialist mit dem Ziel, die Industrie im Besitz von multinationalen Konzernen sowie der chilenischen Oligarchie zu verstaatlichen #vgl(<bildung1970SalvadorAllende2015>) und Chile durch Reformen zu einem sozialistischen Staat zu formen und alle demokratischen Institutionen aufrechtzuerhalten. Allendes Ansatz wurde bekannt als „chilenischer Weg zum Sozialismus“. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production")
\ Nachdem Allendes Regierung die Industrie verstaatlicht hatte, stand sie vor dem Problem, die Unternehmen samt ihrer Mitarbeiter*innen zu steuern. Um diese Probleme zu lösen, kam #emph()[Fernando Flores], der während Allendes Regierung technischer Generaldirektor der #abk("CORFO") – der chilenischen Staatsentwicklungsbehörde #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism") – war, auf die Idee, den britischen Kybernetiker #emph()[Stafford Beer] zu kontaktieren. Flores hoffte, die Steuerung der Wirtschaft Chiles durch Management-Kybernetik erleichtern zu können. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
#abbildung(
  align(center, image("../abbildungen/CORFO-Hierachie2.png", width: 100%)),
  titel: [Hierarchie der Verstaatlichung durch die CORFO vor Cybersyn],
  quelle: [Eigene Darstellung in Anlehnung an Texte aus Cybernetic Revolutionaries #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production")],
)<abb-hCvCnsy>
Vor dem Kontakt zu Beer hatte die #abk("CORFO") bereits Bemühungen unternommen, die verstaatlichten Firmen zu steuern. Wie in @abb-hCvCnsy zu sehen, wurde die Wirtschaft in vier Zweige unterteilt, mit untergeordnete Sektoren. Die Unternehmen innerhalb der Sektoren wurden von sogenannten #emph()[Interventoren] überwacht. Die #emph()[Interventoren] wurden von der Regierung eingesetzt, um die bisherigen Eigentümer und Manager zu ersetzen. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production") Die Sektoren wurden jeweils von einem Komitee überwacht.
Das Problem dabei war, dass die Komitees und auch die Interventoren keine klaren Rollen hatten und zusätzlich zu wenig qualifizierte Interventoren. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production")
\ Als Beer den Brief von Flores erhielt, nahm er diese an. Da er so seine Ideen auf nationaler Ebene testen konnte. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
== Architektur und Entstehung
Schon im November 1971 gab es ein klares Ziel für das Projekt Cybersyn: Bis zum 1. März 1972 sollte eine vorläufige Version des Cybersyn-Projektes installiert werden, welche die Fähigkeiten der Management-Kybernetik aufzeigt. #vgl(<brain-of-the-firm>, seite: 252)
\ Beer hatte das #abk("VSM") bereits entwickelt und gab den Mitarbeiter*innen an dem Projekt die Manuskripte für #emph()[Brain of the Firm]. #vgl(<brain-of-the-firm>, seite: 248)
#abbildung(
  align(center, image("../abbildungen/VSM-Rekursion-Beer.png", width: 65%)),
  titel: [VSM-Rekursion nach Beer: Anwendung auf den chilenischen Staat],
  quelle: [Eigene Darstellung in Anlehnung an Auszüge aus Beers Bericht #emph()[Cybernetic Notes on the Effective Organisation of the State with Particular Reference to Industrial Control] #zitat(<brain-of-the-firm>, seite: 249)],
)<abb-beer-chile-mappin>
Beer erstellte während seines Besuchs zwei Berichte, der erste Bericht beschäftigte sich damit, wie der chilenische Staat in dem #abk("VSM") abgebildet werden könnte, zu sehen in @abb-beer-chile-mappin.
\ Der zweite Bericht war der Entwurf eines vorläufigen Projektes – welches Methoden der Management-Kybernetik auf den chilenischen Staat anwendet –  welches 3 der 4 später realisierten Komponenten beinhaltete. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#tabelle(
  table(
    columns: 2,
    table.header([Komponente], [Funktion]),
    [Cyberstride],
    [Statistik-Software, die basierend auf Live-Produktionsdaten System 1-3 überwacht und bei Abweichungen algedonische Signale an System 4 und 5 sendet. Damit konnte auf Ereignisse wie beispielsweise Knappheit von Rohmaterialien besser reagiert werden, da die Komitees die Interventoren besser beraten und leichter Probleme identifizieren konnten.#vgl(<brain-of-the-firm>, seite: 261) ],

    [CHECO],
    [CHECO ist ein Akronym für CHilean ECOnomy. Es war eine Simulation der chilenischen Wirtschaft. Sie sollte der Regierung als Labor dienen, um zu prognostizieren, welche Auswirkung eine Entscheidung auf die Wirtschaft hat. Für Beer war es eine Implementierung des Systems 4.#vgl(<brain-of-the-firm>, seite: 266)],

    [Cybernet],
    [Cybernet war ein Netzwerk, welches die unterschiedlichen Unternehmen miteinander verbinden sollte. Das Netzwerk war das Rückgrat des Projekts, da es die Live-Daten an die Programme sendete und auch die Kommunikation auf unterschiedlichen Ebenen ermöglichte.],
  ),
  titel: [Komponenten des vorläufigen Projektes],
  quelle: [Eigene Darstellung basierend auf #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")],
)<tab-komp-swp>
In @tab-komp-swp werden die unterschiedlichen Komponenten des vorläufigen Projektes, welches später zu Cybersyn wurde, dargestellt. Cyberstride, das Softwarepaket aus @tab-komp-swp, wurde von der #abk("ECOM") und dem Londoner Büro der US-amerikanischen Unternehmensberatung Arthur Andersen entwickelt.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
\ Für die Wirtschaftssimulation CHECO aus @tab-komp-swp lehnte Beer die Input-Output-Analyse ab.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network") Da Beer diese als strukturarm empfand und seiner Meinung nach stochastische Elemente kaum einführbar waren, wäre eine Input-Output-Analyse für das #abk("VSM") ungeeignet. Zusätzlich wurden große Datenmengen benötigt, die zunächst gesammelt werden mussten. Dies war durch die Frist des Projekts nicht umsetzbar. Beer nutzte deshalb die Sprache DYNAMO.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
\ Cybernet war nur ein Spitzname des Projektteams für das Netzwerk.#vgl(<brain-of-the-firm>, seite: 252) Da zu wenig Computer in Chile vorhanden waren, um Cybernet wie in @tab-komp-swp beschrieben aufzubauen, griff man auf Telex-Maschinen zurück. Telex, kurz für #emph()[Teleprinter Exchange]. Telex waren Fernschreiber mit eindeutiger Nummer, an Telefonnetz angeschlossen. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#abbildung(
  align(center, image("../abbildungen/Telex-Aufbau.png", width: 75%)),
  titel: [Einsatz des Telexnetzwerks zum Austausch von Informationen],
  quelle: [Eigene Darstellung in Anlehnung an #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")],
)<abb-telex-aufbau>
In @abb-telex-aufbau ist aufgezeigt, wie die Kommunikation über Cybernet abgelaufen ist. Eine Besonderheit in @abb-telex-aufbau ist die Benachrichtigung der #abk("CORFO") bei Ausnahmen. Dies ist die Funktion von Cyberstride aus @tab-komp-swp, welche durch Cybernet implementiert wird. Durch die statistischen Berichte war es schwer für Interventoren, Produktionsdaten zu fälschen. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
\ Nachdem die drei Komponenten funktionsfähig waren, kam der Operationsraum dazu. Der Operationsraum hatte das Ziel, die bestehenden Elemente miteinander zu verbinden. Um Entscheidungen basierend auf den Daten der anderen Komponenten getroffen werden.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#abbildung(
  align(center, image("../abbildungen/Ops-Room.png", height: 75%)),
  titel: [Aufbau des Operationsraums],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>, seite: 269) und Gebäudeplan aus #zitat(<medinaCyberneticRevolutinaries2014>, seite: 125)],
)<abb-opsroom>
In @abb-opsroom ist das Design des Raums aufgezeigt.#footnote[Das Design des Operationsraums kam vom #abk("INTEC") unter der Leitung von #emph()[Gui Bonsiepe].#vgl(<brain-of-the-firm>, seite: 268)]
#tabelle(
  table(
    columns: 3,
    table.header([Gerät], [Aufbau], [Aufgabe]),
    [Animiertes #abk("VSM")],
    [Ein zwei Meter hoher Schrank, in dem rotierende Polarisationsscheiben – eine Möglichkeit für mechanische Animation – das #abk("VSM") an eine Wand im Schrank projizierten, sodass es von außen sichtbar ist.],
    [Die Polarisationsscheiben konnten beschriftet werden, die Beschriftung wurde für jede Besprechung angepasst, sodass man das aktuelle Mapping des #abk("VSM") sehen konnte.],

    [Alarmbildschirme],
    [Es gab zwei Bildschirme, welche von Hand bedient werden mussten.],
    [Die Alarmbildschirme zeigten Warnungen für System 3, 4 und 5, falls Abweichungen eintreten.],

    [Algedonische Warnleuchte],
    [Sie wurde durch Blinken zweier roter Leuchten signalisiert.],
    [Die Lampen leuchteten, wenn die Live-Daten der unterliegenden Systeme (1 und 2) von den Berechnungen der CHECO-Simulation abwichen.],

    [Datafeed-Anzeigen],
    [Der Datafeed-Anzeigen bestand aus drei Bildschirmen mit je fünf Rückprojektoren, die eingesetzt wurden, um das Flackern eines ruhenden Bildschirms zu vermeiden. Zusätzlich gab es einen weiteren Bildschirm, der von nur einem Rückprojektor betrieben wurde, um eine Legende der Elemente anzuzeigen.],
    [Der Datafeed-Anzeigen war eine Anzeige der Daten aus dem Cyberstride-Programm, welche über die Kontrollen der Stühle navigiert werden konnte.],

    [Panel of The Future],
    [Das Panel of The Future war eine in Stoff gehüllte Magnetwand. Es gab unterschiedliche Arten an Magneten, welche einen bestimmten Teil der Wirtschaft darstellten. #vgl(<medinaCyberneticRevolutinaries2014>, seite: 128) ],
    [Durch die Simulation sollte geprüft werden, ob eine Entscheidung eine positive oder eine negative Auswirkung auf die Wirtschaft hat. Durch die Magnetwand konnte man leicht auch ohne Rechner Ideen testen.],
  ),
  titel: [Bestandteile des Operationsraums],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>) Seite 268 - 270 und #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine")],
) <tab-opsroom-aufbau>
In der @tab-opsroom-aufbau werden die Bestandteile des Operationsraums noch einmal genauer aufgeschlüsselt. Anhand des Aufbaus der Geräte in @tab-opsroom-aufbau sieht man, dass viele der Geräte nicht wirklich funktional waren. Der Raum ware eine futuristische Vision, da der Raum wegen technischer Limitationen nie wirklich funktional umgesetzt wurde. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine") Ein Beispiel ist das #emph()[Panel of The Future] welches ursprünglich eine Live-Simulation durch CHECO sein sollte, der benötigte Computer wurde allerdings nie fertiggestellt.#vgl(<brain-of-the-firm>, seite: 270)
\ Die Stühle – Um die Mitte des Raums  – wurden extra so angeordnet, sodass aus jedem Stuhl alles gesehen werden konnte. Das Bedienfeld des Operationsraums war explizit auf Arbeiter*innen zugeschnitten. Die Steuerung sollte leicht bedienbar und sehr robust sein. Beer nannte es auch #emph()[Big Hand Control]. #vgl(<brain-of-the-firm>, seite: 270)
\ Eine fünfte, nie implementierte Komponente war Cyberfolk: ein Rückkanal, über den die Bevölkerung per Regler algedonische Signale an die Regierung senden sollte. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
#abbildung(
  align(center, image("../abbildungen/cyberfolk.png", height: 75%)),
  titel: [Beers Plan für Projekt Cyberfolk],
  quelle: [Eigene Darstellung in Anlehnung an Zeichnung von Beer aus  #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")],
)<abb-cyberfolk>
@abb-cyberfolk zeigt auf, wie Beer sich die Partizipation der Bevölkerung vorgestellt hat.  Die Abstimmungen sollen anonym bleiben, damit die Regierung unzufriedene Personen nicht unterdrücken konnte. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
== Anwendung und Verlauf
Im Oktober 1972 begann ein nationaler Streik von #abk("LKW")-Fahrern. Durch den Streik war es erschwert, die Grundversorgung – insbesondere Nahrung, Rohmaterialien und Treibstoff – intakt zu halten. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike") Die Streikteilnehmer stiegen schnell von 12.000 auf 40.000. #vgl-nach-kap(<laprensa1972camiones>, <medinaCyberneticRevolutinaries2014>, seite: 474, kap-sek: "5 The October Strike") Auch Besitzer von Läden haben sich an dem Streik beteiligt und ihre Läden geschlossen. Läden, die offen blieben, wurden von Gruppen angegriffen, damit sie schließen. Zusätzlich haben auch Doktoren, Ingenieure und Anwälte gestreikt. #vgl-nach-kap(<stallings1978class>, <medinaCyberneticRevolutinaries2014>, seite: 141, kap-sek: "5 The October Strike") Zusätzlich haben Rechte Konsumgüter gehortet, und die Streikenden wurden von den #abk("USA") unterstützt. #vgl-nach-kap(<stallings1978class>, <medinaCyberneticRevolutinaries2014>, seite: 142, kap-sek: "5 The October Strike") Durch den Streik drohte der Regierung, ihre Macht zu verlieren. Deshalb setzten sie das Militär ein, um den Streik zu regulieren; durch den Einsatz des Militärs konnten einige Fabriken weiterarbeiten. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike")  Obwohl die Produktion weiterlief, gab es ein Problem, die noch bestehenden Fabriken zu orchestrieren. Grandi und Flores kamen daher auf die Idee, Cybernet zu nutzen, um die Grundversorgung zu erhalten. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike") Es wurde eine zentrale Kommandozentrale im Präsidentenpalast errichtet und spezialisierte Kommandozentralen – für Transport, Industrie, Energie, Banken, Landwirtschaft, Gesundheit und Güterversorgung –, welche über Cybernet mit der zentralen Kommandozentrale verbunden waren und tagesaktuelle Daten lieferten. So flossen Informationen direkt nach oben und Befehle direkt nach unten. So kam es nie zum Produktionsstopp. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike")  Trotzdem hat die Regierung den Streik nicht unterdrücken können, aber da die Streikenden auch keinen Produktionsstopp erreichten, gab es am 2. November ein Patt. Der Streik wurde beendet und Allende blieb Präsident. Der General Carlos Prats wurde zum Innenminister und damit Stellvertreter des Präsidenten. Da die Streikenden einen Konflikt mit dem Militär vermeiden wollten, stimmten sie zu. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "5 The October Strike")
== Ende des Projekts
Das Ende des Projekts begann mit einem zweiten #abk("LKW")-Streik. Bei dem Streik wurde Cybernet wieder verwendet, doch dieses Mal waren die Proteste gewaltvoller. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "6 Cybersyn Goes Public") Am 3. September 1973 veröffentlichte die rechte chilenische Zeitung #emph()[Qué Pasa] einen Artikel, der  Cybersyn als Kontrollwaffe der Regierung darstellte. #vgl-nach-kap(<quepasa1973cyberstride>, <medinaCyberneticRevolutinaries2014>, kap-sek: "6 Cybersyn Goes Public") Der Artikel hatte das Ziel, Misstrauen zu schüren und öffentliche Unterstützung für einen Militärputsch zu erzeugen. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "6 Cybersyn Goes Public") Der Militärputsch fand am 11. September 1973 statt. Bei dem Putsch kam Allende ums Leben, Flores wurde verhaftet und das Militär übernahm die Regierung. #vgl-nach-kap(<guzman2004salvador>, <medinaCyberneticRevolutinaries2014>, kap-sek: "6 Cybersyn Goes Public") Nachdem das Militär an die Macht gekommen war, wurde nicht mehr an dem Projekt gearbeitet und die meisten Dokumente und Gegenstände des Projekts wurden zerstört. #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "7 Conclusion: Technology, Politics, History")

