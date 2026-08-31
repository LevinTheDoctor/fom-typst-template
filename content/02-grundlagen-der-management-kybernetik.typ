#import "../template/fom.typ": *
= Grundlagen der Management-Kybernetik
Dieses Kapitel behandelt die Grundlagen der Kybernetik, die Ausprägung Management-Kybernetik und deren Begriffe.
== Kybernetik
Kybernetik ist nicht eindeutig definierbar, da Kybernetiker*innen dem Begriff unterschiedliche Bedeutungen zuschreiben.#vgl(<khanForewordCyberneticsStateArt2017>, seite: "viii") Die Literatur zu Cybersyn nutzt die 1948 von Norbert Wiener geprägte Definition aus dem Werk #emph()[„Cybernetics: Or Control and Communication in the Animal and the Machine“]. Grund dafür ist, dass Eden Medina diese Definition genutzt hat.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
\ Wieners Definition beschreibt Kybernetik als Forschungsfeld, das Kommunikationstheorie, Berechenbarkeit, Automatentheorie und Neurophysiologie vereint.#vgl(<wienerCybernetics1948>, seite: 12) Der Begriff Kybernetik leitet sich vom griechischen Wort #emph()[kubernêtês] ab.#footnote[Ein #emph()[kubernêtês] war im antiken Griechenland ein Steuermann von #emph()[Triremen], also von Kriegsschiffen. Ein #emph()[kubernêtês] musste nicht nur das Schiff steuern, sondern auch bei Seeschlachten entsprechend reagieren können. Der Begriff ist heute auch deshalb geläufig, weil der von Google entwickelte Container-Orchestrator #abk("K8s") nach ihm benannt wurde. Vgl. #zitat(<WasIstKubernetes>).] Übersetzungen sind Steuermann, Regieren, Regulation und Management.#vgl(<wernerIntroductionCyberneticsStateArt2017>, seite: 3) Diese Bedeutungen spiegeln das Ziel der Kybernetik: die Gemeinsamkeiten von Maschinen und Organismen in Kommunikation, Feedback und Steuerung zu verstehen.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
== Management-Kybernetik
Management-Kybernetik versucht, ein Unternehmen mit kybernetischen Methoden – Feedback-Loops und Kommunikation aus der Kybernetik – zu steuern und zu optimieren. Beer#footnote[Beer prägte die Management-Kybernetik durch seine Werke maßgeblich. Norbert Wiener bezeichnete ihn als „Vater der Management-Kybernetik“. Vgl. #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism").] versteht eine Wirtschaft als System, vergleichbar mit einem Organismus. Beers Fokus bei der Management-Kybernetik ist Handeln.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")
=== Viable System Model
Das #abk("VSM"), zu Deutsch Modell des lebensfähigen Systems, ist Beers zentrales Modell.#footnote[Das #abk("VSM") wurde von Espejo, dem späteren operativen Leiter Cybersyns, sogar als die größte Errungenschaft des Projekts bezeichnet. Vgl. #zitat(<espejoCybersynBigData2022>, seite: 1165).] Beer entwarf es über mehrere Jahre, basierend auf seinem Verständnis des Nervensystems.#vgl(<brain-of-the-firm>, seite: 137) Im Buch #emph()[Brain of the Firm]#footnote[Brain of the Firm war nicht Beers einziges Buch zum #abk("VSM"). Er veröffentlichte insgesamt drei Bücher zum #abk("VSM") (#zitat(<beerBrainFirm1972>), #zitat(<beerHeartEnterprise1979>), #zitat(<beerDtsfo>)). Vgl. #zitat(<espejoCybersynBigData2022>, seite: 1164). Brain of the Firm wird in dieser Seminararbeit verwendet, da es die Grundlagen des #abk("VSM") erklärt. In der Seminararbeit wird die 2. Auflage von 1981 verwendet, da dort ein extra Kapitel hinzugefügt wurde, welches die Arbeit an Cybersyn reflektiert. Vgl. #zitat-kap(<brain-of-the-firm>, kap: "Part Four The Course of History").] erklärte er es erstmals in seiner finalen Form.#vgl(<brain-of-the-firm>, seite: 130) Das #abk("VSM") zeigt auf, wie sich ein System verhält, nicht, wie es aufgebaut ist. Es geht davon aus, dass eine komplexe Organisation nicht streng hierarchisch aufgebaut sein sollte,#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism") sondern aus vielen separaten Systemen besteht, die über eine leichte Hierarchie miteinander kommunizieren und per Signal auf Änderungen der Umwelt reagieren.#vgl(<brain-of-the-firm>, seite: 103)
#abbildung(
  align(center, image("../abbildungen/VSM-Modell.png", width: 80%)),
  titel: [Aufbau des Viable System Model],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>, seite: 130)],
) <abb-vsm>
Das Modell besteht aus drei Teilen und fünf Systemen, die horizontal wie vertikal miteinander kommunizieren (@abb-vsm). System 1 ist rekursiv, da es intern denselben Aufbau des #abk("VSM") hat.#vgl(<brain-of-the-firm>, seite: 156)
#tabelle(
  table(
    columns: 2,
    [Bestandteil], [Erklärung],
    [Umwelt],
    [Die Umwelt ist der Kontext, mit dem sich ein System auseinandersetzt. Die grau schraffierten Flächen sind Überschneidungen aus mehreren Kontexten. Die Zukunft basiert auf statistischen Hochrechnungen von aktuellen und vergangenen Ereignissen.],

    [Operatives System],
    [Das operative System ist die ausführende Ebene mit einer klaren Aufgabe. Die operativen Systeme (System 1) handeln meist autonom, kommunizieren aber mit den Metasystemen und werden von System 2 koordiniert.],

    [Metasystem],
    [Die Metasysteme erhalten Daten aus den unterliegenden Systemen und treffen darauf basierend Entscheidungen. System 3 hat dabei die Aufgabe, System 1 und die Informationen aus System 2 zu überwachen. System 4 filtert Informationen für System 5 vor und ist gleichzeitig die Adaptionsfunktion, die mit der Umwelt sowie der Zukunft interagiert. System 5 überwacht die unterliegenden Systeme anhand gefilterter Informationen. Es soll keine strikten Vorgaben machen, sondern Informationen vergleichen und Informationskonflikte lösen.],
  ),
  titel: [Aufgaben der Bestandteile des Viable System Model],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<brain-of-the-firm>, seite: 130) und #zitat-kap(<medinaCyberneticRevolutinaries2014>, kap: "1 Cybernetics and Socialism")],
) <tab-vsm-aufbau>
@tab-vsm-aufbau erklärt die Funktion und den Aufbau der drei Teile des #abk("VSM").
=== Algedonische Signale
Der Begriff setzt sich aus dem Griechischen #emph()[algos] (Schmerz) und #emph()[hedone] (Lust/Vergnügen) zusammen. Er bezeichnet ein Signal für eine Abweichung ohne zusätzliche Informationen.#vgl(<brain-of-the-firm>, seite: 401)
Diese Signale werden von den operativen Systemen (@tab-vsm-aufbau) an die Metasysteme übermittelt.
