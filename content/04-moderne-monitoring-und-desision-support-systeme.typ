#import "../template/fom.typ": *
= Moderne Monitoring- und Decision-Support-Systeme
#abk("DSS") sind computergestützte Systeme, die das Urteilsvermögen von Entscheidungsträger*innen durch Modelle, Methoden und relevante Daten verbessern, um so Entscheidungsprozesse zu optimieren.#vgl(<gluchowskiManagementSupportSysteme2008a>, seite: 63)
#abbildung(
  align(center, image("../abbildungen/DSSundMS.png", width: 90%)),
  titel: [Zusammenspiel von Decision-Support- und Monitoring-System anhand des Beispiels einer Cloud-Anwendung],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<gluchowskiManagementSupportSysteme2008a>, seite: 67), #zitat-nach(<SpragueDSS>, <gluchowskiManagementSupportSysteme2008a>, seite-sek: 67, seite: 195) und #zitat(<albuquerqueTracingMetricsDesign2025>)],
)<abb-ms-dss-cloud>
Das #abk("DSS") in @abb-ms-dss-cloud ist nach dem Sprague-Modell (@tab-sp-m)#footnote[Das Sprague-Modell besteht aus Datenbank, Methodenbank, Modellbank, Reportbank und Dialogsystem. Vgl. #zitat-nach(<SpragueDSS>, <gluchowskiManagementSupportSysteme2008a>, seite-sek: 67, seite: 195).] aufgebaut.#vgl-nach(<SpragueDSS>, <gluchowskiManagementSupportSysteme2008a>, seite-sek: 67, seite: 195)
#tabelle(
  table(
    columns: 2,
    table.header([Komponente], [Erklärung]),
    [Datenbank], [Zuverlässiges Verwalten von Daten über ein Datenbanksystem],
    [Reportbank], [Speichert erstellte Berichte sowie Berichtsschablonen],
    [Methodenbank], [Speichert Auswertungsvorgänge und algorithmische Verfahren, um diese schnell wieder zu verwenden],
    [Modellbank], [Speichert logische Modelle sowie die zugehörigen Berechnungsvorschriften.],
    [Dialogsystem],
    [Ein Dialogsystem ist eine Benutzerschnittstelle, welche die Daten und Modelle verständlich aufbereitet und Interaktion ermöglicht.],
  ),
  titel: [Komponenten des Sprague-Modells],
  quelle: [Eigene Darstellung in Anlehnung an #zitat-kap(<gluchowskiManagementSupportSysteme2008a>, kap: [3.2.2 Bestandteile und Aufbau der DSS])],
)<tab-sp-m>
Damit ein #abk("DSS") funktioniert, benötigt es Daten.#vgl(<gluchowskiManagementSupportSysteme2008a>, seite: 70) Diese entstehen durch Monitoring, zu Deutsch Überwachung (@abb-ms-dss-cloud). Monitoring beschreibt das Sammeln und Erfassen von Echtzeitdaten zu einem System.#vgl-kap(<sreBook>, kap: "6")
Ein #abk("MS") ist je nach zu überwachendem Bereich unterschiedlich aufgebaut.
#tabelle(
  table(
    columns: 3,
    table.header([Methoden], [Funktion], [Verwendungszweck]),
    [Audit Logging],
    [Audit Logs speichern, wer wann was gemacht hat.],
    [Wenn ein*e Nutzer*in einen Fehler meldet, kann so nachvollzogen werden, was diese Person getan hat.],

    [Standard Logging], [Logging in einem einheitlichen Format.], [Erleichtert das Lesen und Verstehen der Logs.],

    [Tracing],
    [Eine Anfrage an eine Anwendung wird mit einer einzigartigen ID versehen, um anhand dieser nachzuvollziehen, wie sie bearbeitet wird.],
    [Durch Tracing wird nachvollziehbar, wie eine Anfrage bearbeitet wird, sodass die Fehlerbehebung erleichtert wird.],

    [Deployment Tracking],
    [Jedes Deployment inklusive der Änderungen wird festgehalten.],
    [Wenn durch ein Deployment eine fehlerverursachende Änderung in eine Produktionsumgebung eingespielt wird, lässt sich der Fehler schneller lokalisieren.],

    [Exception Tracking],
    [Wenn eine #emph[Exception] auftritt, wird diese zentral gespeichert.],
    [Die zentrale Speicherung verbessert die Fehlerbehebung, weil eine #emph[Exception] dadurch leichter einsehbar ist.],

    [Lebendigkeits-Endpunkt],
    [Jede Anwendung erhält einen Lebendigkeits-Endpunkt, um zu prüfen, ob sie verfügbar ist.],
    [Ein Load Balancer prüft den Endpunkt in regelmäßigen Abständen. Schlägt der Endpunkt fehl, wird automatisch ein Signal gesendet, sodass alarmiert werden kann.],

    [Bereitschafts-Endpunkt],
    [Jede Anwendung erhält einen Bereitschafts-Endpunkt, um zu prüfen, ob sie Anfragen bearbeiten kann.],
    [Durch den Endpunkt kann ein Load Balancer entscheiden, an welche Instanz einer Anwendung eine Anfrage weitergeleitet wird.],

    [Synthetischer Test],
    [Für eine Anwendung wird eine Sammlung an Tests geschrieben, die regelmäßig an dem Produktivsystem ausgeführt werden.],
    [So wird geprüft, ob die Produktionsumgebung wie vorgesehen reagiert.],

    [Anwendungsmetriken],
    [Performance- und Verwendungsdaten werden basierend auf Logs zentral gespeichert.],
    [So wird geprüft, ob eine weitere Instanz einer Anwendung benötigt wird oder ob diese optimiert werden muss.],

    [Infrastrukturmetriken],
    [Es werden Metriken über die Gesundheit der Hardware innerhalb des Rechenzentrums erfasst.],
    [So kann geprüft werden, ob ein Fehler nicht an der Software, sondern an der Hardware liegt.],
  ),
  titel: [Methoden einer beobachtbaren Cloud-Anwendung],
  quelle: [Eigene Darstellung in Anlehnung an #zitat-kap(<albuquerqueTracingMetricsDesign2025>, kap: "3 About the Patterns")],
)<tab-obsr-cloud>

In der Cloud werden dazu technische Daten (@tab-obsr-cloud) genutzt. Die Implementierung dieser Metriken wird auch #emph[Observability] genannt und ermöglicht Performance-Optimierung, Diagnose von Fehlern und Pflege.#vgl(<albuquerqueTracingMetricsDesign2025>, seite: 22)
== Architektur moderner Monitoring- und Decision-Support-Systeme anhand von Azure Monitor
Azure Monitor#footnote[In diesem Kapitel wird die Dokumentation des Azure Monitor von Microsoft Learn als Primärquelle genutzt; Azure Monitor ist nur ein Beispiel für #abk("MS") und #abk("DSS") als Observability-Dienst in der Cloud.] ist der #emph[Observability]-Dienst der Azure Cloud.#vgl(<austinmccollumAzureMonitorUebersicht>) In @abb-ms-dss-cloud und @tab-obsr-cloud wurde erklärt, wie #abk("MS") und #abk("DSS") in Cloud-Umgebungen zusammenarbeiten.
#abbildung(
  align(center, image("../abbildungen/azure-monitor.png")),
  titel: [Architektur von Azure Monitor],
  quelle: [Eigene Darstellung basierend auf #zitat(<austinmccollumAzureMonitorUebersicht>) und #zitat(<bandersmsftSmartDetectionApplication>)],
)<abb-azure-monitor>
Azure Monitor kann in #abk("MS") und #abk("DSS") unterteilt werden (@abb-azure-monitor). Der #abk("MS")-Teil sammelt Metriken, Logs und Traces, die von Azure zentral gespeichert werden.#vgl(<austinmccollumAzureMonitorUebersicht>) Der #abk("DSS")-Teil umfasst Log Analytics, Metrics Explorer und die Insights des jeweiligen Dienstes.#vgl(<austinmccollumAzureMonitorUebersicht>) Zusätzlich besteht die Möglichkeit, diese Daten automatisiert in Diensten wie Power BI, Grafana oder Workbooks aufzubereiten.#vgl(<austinmccollumAzureMonitorUebersicht>) Bei Anomalien und Performance-Problemen innerhalb von Application Insights werden automatisch Warnungen durch Smart Detection als E-Mail an die zuständigen Personen gesendet (@abb-azure-monitor).#vgl(<bandersmsftSmartDetectionApplication>) Die Autoskalierungsvorhersage liefert Prognosen für die CPU-Auslastung, berechnet durch maschinelles Lernen anhand vergangener Daten.#vgl(<autoscalePred>)
