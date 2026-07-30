#import "../template/fom.typ": *
= Grundlagen der Management-Kybernetik
Dieses Kapitel behandelt die Grundlagen der Management-Kybernetik. Um diese zu verstehen – insbesondere in Bezug zu dem Cybersyn-Projekt – muss auch der Begriff der Kybernetik erklärt werden. Die Begriffe sind miteinander verknüpft, da die Management-Kybernetik eine besondere Ausprägung der Kybernetik ist. Aber auch in dem Feld der Management-Kybernetik gibt es Modelle und Begriffe, die eine gesonderte Definition verdient haben.
== Kybernetik
Kybernetik ist ein nicht klar definierbarer Begriff, da viele Kybernetiker*innen dem Begriff eine unterschiedliche Bedeutung zusprechen. In der Literatur zu Cybersyn wird oft Gebrauch von der 1948 entstandenen Definition nach dem MIT-Mathematiker Norbert Wiener aus dem Paper #emph()[„Cybernetics: Or Control and Communication in the Animal and the Machine“] gemacht #vgl(<cCyberneticsStateArt2017>, seite: 2). Das hat den Hintergrund, dass Eden Medina in ihrem 2011 erschienenen Werk #emph()[Cybernetic Revolutionaries: Technology and Politics in Allende’s Chile] eben diese Definition mit dem Projekt Cybersyn verquickt hat. #zit(<medinaCyberneticRevolutinaries2014>, seite: 23) Nicht nur, weil Eden Medina diese in ihrem Werk nutzte, sondern auch, da Wiener oft als Vater der Kybernetik bezeichnet wird und im Kontakt zu Stafford Beer stand und diesen als Vater der Management-Kybernetik bezeichnet,#vgl(<medinaCyberneticRevolutinaries2014>, seite: 23) ist Wieners Definition der Standard in der Literatur zum Cybersyn-Projekt.
=== Kybernetik nach Norbert Wiener
Wieners Definition beschreibt Kybernetik als ein Forschungsfeld, welches die Forschungsfelder der Kommunikationstheorie, Berechenbarkeit, Automatentheorie und Neurophysiologie vereint. #vgl(<medinaCyberneticRevolutinaries2014>, seite: 23) Kybernetik wird von dem griechischen Wort #emph()[kubernêtês] abgeleitet, es kann auf mehrere Weisen übersetzt werden. Eine bekannte Übersetzung ist Steuermann, da die Person, welche eine #emph()[trireme] – eine Bauart von Kriegsschiffen im antiken Griechenland – befehligt hat, in dem antiken Griechenland #emph()[kubernêtês] genannt wurde. Andere Übersetzungen je nach Kontext können aber auch Regieren, Regulation und Management sein.#vgl(<cCyberneticsStateArt2017>, seite: 3) Der Steuermann und die weiteren Bedeutungen des Wortes #emph()[kubernêtês] sind ein gutes Sinnbild für das Ziel von Kybernetik: das Verstehen der Gemeinsamkeiten von Maschinen und Organismen in den Bereichen der Kommunikation, Feedback und Steuerung. #vgl(<medinaCyberneticRevolutinaries2014>, seite: 24)
== Management-Kybernetik
Stafford Beer, die Schlüsselfigur und der Architekt hinter dem Cybersyn-Projekt #vgl(<medinaCyberneticRevolutinaries2014>, seite: 20), ist bekannt für seine Arbeit in einer besonderen Ausprägung der Kybernetik, nämlich der Management-Kybernetik. Beer wurde auch als Vater der Management-Kybernetik bezeichnet.#vgl(<medinaCyberneticRevolutinaries2014>, seite: 23) Die Management-Kybernetik ist ein integraler Bestandteil des Cybersyn-Projekts, da diese der Grundbaustein für das Cybersyn-Projekt ist. Viele der Ideen, die in Kapitel 3 später besprochen werden, sind lediglich Versuche, Management-Kybernetik in der realen Welt umzusetzen.
=== Definition von Management-Kybernetik
Bei der Management-Kybernetik wird versucht, durch kybernetische Methoden ein Unternehmen oder sogar – wie im Projekt Cybersyn – eine Wirtschaft eines ganzen Landes zu steuern und zu optimieren, eben durch aus der Kybernetik stammende Feedback-Loops und Kommunikation. Beer versteht eine Wirtschaft als ein System, vergleichbar mit einem Organismus. Beers Fokus bei der Management-Kybernetik ist Handeln, anstatt Modellierung von Daten wie bei der Kybernetik nach Wiener #vgl(<medinaCyberneticRevolutinaries2014>, seite: 34).
=== Viable System Model
Um Beers Ideen besser zu verstehen, muss man auch ein besonderes Modell von Beer verstehen, nämlich das #emph()[Viable System Model], zu Deutsch Modell des lebensfähigen Systems. Beer entwarf das Modell über mehrere Jahre iterativ, basierend auf seinem Verständnis des menschlichen Nervensystems #vgl(<medinaCyberneticRevolutinaries2014>, seite: 43). In dem Buch #emph()[Brain of the Firm] aus dem Jahr 1972 wurde es erstmals in seiner finalen Form erklärt.#vgl(<brain-of-the-firm>, seite: 130) Das #emph()[Viable System Model] versucht aufzuzeigen, wie ein System sich verhält und nicht, wie es aufgebaut ist. Auch während des Cybersyn-Projektes handelt Beer mit dem Verständnis, dass eine komplexe Organisation – egal ob Unternehmen oder die Wirtschaft eines Landes – nicht streng hierarchisch sein sollte #vgl(<brain-of-the-firm>, seite: 34), sondern so operieren sollte, dass schnell, organisch und vor allem autonom auf Änderungen der Umwelt reagiert werden kann, sodass ein System adaptiv und selbstregulierend handeln kann.#vgl(<brain-of-the-firm>, seite: 103)
#abbildung(
  align(center, image("../abbildungen/VSM-Modell.png", width: 60%)),
  titel: [Aufbau des Viable System Model],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>, seite: 130)],
) <abb-vsm>
Wie in @abb-vsm zu erkennen, besteht das Modell aus drei großen Teilen und fünf rekursiven Systemen – rekursiv sind sie deshalb, weil jedes System intern auch den Aufbau des #emph()[Viable System Model] hat. Beer hat sich dabei von Zellen eines Organismus inspirieren lassen, welche immer die Blaupause für den gesamten Organismus in sich tragen #vgl(<medinaCyberneticRevolutinaries2014>, seite: 44). Anhand von @abb-vsm kann man erkennen, dass die Systeme vertikal sowie horizontal miteinander kommunizieren.

#tabelle(
  table(
    columns: 2,
    [Bestandteil], [Erklärung],
    [Umwelt],
    [Die Umwelt ist der Kontext, mit dem sich ein System auseinandersetzt. Die grau schraffierten Flächen sind Überschneidungen aus mehreren Kontexten],

    [Operatives System],
    [Das operative System ist die ausführende Ebene mit einer klaren Aufgabe. Die operativen Systeme (System 1) handeln meist autonom, aber kommunizieren mit den Metasystemen und erhalten von ihnen Ziele über System 2],

    [Metasystem],
    [Die Metasysteme erhalten Daten aus den unterliegenden Systemen und versuchen, darauf Entscheidungen zu treffen. System 3 hat dabei die Aufgabe, System 1 sowie die Informationen aus System 2 zu überwachen. System 4 ist dabei der Punkt, an dem System 5 in die Entscheidungen der unterliegenden Systeme eingreifen kann, indem es System 5 gefilterte Informationen aus den unterliegenden Systemen sowie der Umwelt und statistische Prognosen für die Zukunft bietet. System 5 soll dabei keine strikten Vorgaben geben, sondern Informationen vergleichen und Informationskonflikte lösen],
  ),
  titel: [Aufgaben der Bestandteile des VSM-Modell],
  quelle: [Eigene Darstellung basierend auf der VSM Grafik und Brain Of The Firm #zitat(<brain-of-the-firm>, seite: 130)  und Dem Buch Cybernetic Revolutionaries #zitat(<medinaCyberneticRevolutinaries2014>, seite: 46)],
) <tab-vsm-aufbau>
