#import "../template/fom.typ": *
= Moderne Monitoring- und Decision-Support-Systeme
#abk("DSS") sind computergestützte Systeme, die das Urteilsvermögen von Entscheidungsträgern durch Modelle, Methoden und relevante Daten verbessern, um so Entscheidungsprozesse zu optimieren. #vgl(<gluchowskiManagementSupportSysteme2008a>, seite: 63)
#abbildung(
  align(center, image("../abbildungen/DSSundMS.png", width: 90%)),
  titel: [Zusammenspiel von #abk("DSS") und #abk("MS") anhand des Beispiels einer Cloud Anwendung],
  quelle: [Eigene Darstellung in Anlehnung an #zitat(<gluchowskiManagementSupportSysteme2008a>, seite: 70) und #zitat(<albuquerqueTracingMetricsDesign2025>)],
)<abb-ms-dss-cloud>
Damit ein #abk("DSS") funktioniert benötigt es Daten. #vgl(<gluchowskiManagementSupportSysteme2008a>, seite: 70) Diese entstehen durch Monitoring, zu Deutsch Überwachung (@abb-ms-dss-cloud). Der Aufbau eines #abk("MS") unterscheidet sich je nach zu überwachendem Bereich.
#tabelle(
  table(
    columns: 3,
    table.header([Methoden], [Funktion], [Verwendungszweck]),
    [Audit Logging],
    [Audit Logs speichern, wer wann was gemacht hat.],
    [Wenn ein Nutzer einen Fehler meldet, kann so nachvollzogen werden, was dieser getan hat.],

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
  titel: [Monitoring Metriken einer beobachtbaren Cloud Anwendung],
  quelle: [Eigene Darstellung in Anlehnung an #zitat-kap(<albuquerqueTracingMetricsDesign2025>, kap: "3 About the Patterns")],
)<tab-obsr-cloud>

In der Cloud werden dazu technische Daten (@tab-obsr-cloud) genutzt. Die Implementierung dieser Metriken wird auch #emph[Observability] genannt und ermöglicht Performance-Optimierung, Diagnose von Fehlern und Pflege.#vgl(<albuquerqueTracingMetricsDesign2025>, seite: 22)
== Architektur moderner Monitoring- und Decision-Support-Systeme anhand von Azure Monitor
Azure Monitor #footnote[In diesem Kapitel nutze ich die Dokumentation Azure Mointors als Primär Quelle, Azure Monitor ist nur ein Beispiel für #abk("MS") und #abk("DSS") in als Observability-Dienst in der Cloud] ist der #emph[Observability] Dienst der Azure Cloud.#vgl-kap(<austinmccollumAzureMonitorUebersicht>, kap: "Azure Monitor – Übersicht")  In @abb-ms-dss-cloud und @tab-obsr-cloud wurde erklärt wie #abk("MS") und #abk("DSS") in Cloud Umgebungen zusammen Arbeiten.
#abbildung(
  align(center, image("../abbildungen/azure-monitor.png")),
  titel: [Architektur von Azure Monitor],
  quelle: [Eigene Darstellung basierend auf #zitat(<austinmccollumAzureMonitorUebersicht>) und #zitat(<bandersmsftSmartDetectionApplication>)],
)<abb-azure-monitor>

