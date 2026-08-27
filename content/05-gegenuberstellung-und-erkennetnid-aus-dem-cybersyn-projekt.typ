#import "../template/fom.typ": *
= Gegenüberstellung und Erkenntnisse aus Cybersyn
Das Ziel des Azure Monitor unterscheidet – Monitoring von Azure Diensten #vgl(<austinmccollumAzureMonitorUebersicht>) – sich von denen Cybersyns – Steuern der chilenischen Wirtschaft #vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "2 Cybernetics in the Battle for Production") – trotzdem lassen sich Ideen aus Cybersyn auf Azure Monitor übertragen.
#tabelle(
  table(
    columns: 3,
    table.header([VSM Komponente], [Komponente des Azure Monitor Beispiel], [Begründung]),
    [System 1],
    [Überwachte Dienste in der Azure Cloud Umgebung.],
    [Die Dienste in der Azure Umgebung sind die operativen Systeme, sie haben eine eigene Aufgabe, die sie bearbeiten müssen.],

    [System 2], [Lebendigkeits- und Bereitschafts-Endpunkt für den Loadbalancer.], [],
    [System 3],
    [#abk("MS")-Teil Sammlung von Metriken, Logs und Traces.],
    [Der #abk("MS")-Teil sammelt Metriken, Logs und Traces über System 1 und übermittelt diese an die überliegenden Systeme.],

    [System 4],
    [Autoskalierungsvorhersage.],
    [Es wird versucht, aus bestehenden Daten eine Vorhersage für die Zukunft zu treffen, um Performance-Einbrüche zu verhindern, diese kann aber auch durch Limits, die System 5 vorgibt, gesteuert werden.],

    [System 5],
    [Cloud Engineer.],
    [Der Cloud Engineer erhält über Azure Informationen aus den unterliegenden Systemen, kann aber je nach Bedarf eingreifen.],

    [Algedonischer Kanal],
    [Smart Detection.],
    [Sobald Abweichungen in den Application Insights entstehen, wird dies durch Smart Detection erfasst.],
  ),
  titel: [Übertragung des Azure Monitor auf das VSM],
  quelle: [Eigene Darstellung basierend auf #zitat(<brain-of-the-firm>, seite: 130) und #zitat(<austinmccollumAzureMonitorUebersicht>) ],
)<tab-am-vsm>
Das #abk("VSM") lässt sich auf Azure Monitor übertragen (@tab-am-vsm). Der Fokus Cybersyns auf Echtzeitdaten,#vgl(<espejoCybersynBigData2022>, seite: 1166) – wegen der technischen Limitationen nicht umgesetzt wurde#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "4 Constructing the Liberty Machine") – ist auch bei dem Azure Monitor wieder zu finden.#vgl(<austinmccollumAzureMonitorUebersicht>) Ein Faktor den Azure Monitor besitzt, Cybersyn aber erst durch Weiterarbeit bis zur Mitte der 1980er sind #abk("KPI").#vgl(<espejoCybersynBigData2022>, seite: 1166) Azure Monitors #abk("KPI")s sind Anwendungs- und Infrastrukturmetriken.#vgl(<austinmccollumAzureMonitorUebersicht>)
== Datenerhebung und Ausnahmeprinzip
Die Datenerhebung bei Cybersyn wurde durch die Interventoren durchgeführt, welche diese dann über Cybernet an die #abk("ECOM") übermittelt haben, und dort wurden die Daten in Cyberstride eingespeist (@abb-telex-aufbau).#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network") Cyberstride hat Berechnungen durchgeführt und bei einer Abweichung ein algedonisches Signal versendet.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network") Azure sammelt die Daten kontinuierlich, und sobald Smart Detection eine Abweichung registriert, wird eine Benachrichtigung versendet.#vgl(<bandersmsftSmartDetectionApplication>) Die Benachrichtigung, die durch Azure Monitor entsteht, ist nicht algedonisch, da sie genauere Informationen enthält.#vgl(<bandersmsftSmartDetectionApplication>) Die Berechnung, um zu bestimmen, ob eine Abweichung eingetreten ist, entspricht sowohl bei Cybersyn als auch bei Azure Monitor der Implementierung einer Methodenbank (@tab-sp-m). Azures Vorteil gegenüber Cybersyn ist der kontinuierliche Fluss von Daten,#vgl(<austinmccollumAzureMonitorUebersicht>) statt der täglichen Berichte über das Cybernet.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network")
== #abk("DSS") und ihre Grenzen
#abk("CHECO") hat kein konkretes Pendant in Azure Monitor, das nächstliegende wäre die Autoskalierungsvorhersage. Die Autoskalierungsvorhersage beschäftigt sich mit Prognosen für das eigene System; ein Einspielen von stochastischen Methoden ist nicht möglich.#vgl(<autoscalePred>) #abk("CHECO") hingegen beschäftigt sich mit der Umwelt und der Zukunft.#vgl-kap(<medinaCyberneticRevolutinaries2014>, kap: "3 Designing a Network") Um die Zukunft simulieren zu können, waren stochastische Elemente explizit von Beer gewollt.#vgl(<brain-of-the-firm>, seite: 266) Wie in Kapitel 3.3 erwähnt, lehnte Beer eine Input-Output-Analyse ab.#vgl(<brain-of-the-firm>, seite: 265) Stochastische Elemente werden in Azure nicht benötigt, da die automatische Skalierung bei unvorhersehbarer Auslastung die Möglichkeit bietet, den Dienst immer anhand der Last zu skalieren.#vgl(<autoscale>)



