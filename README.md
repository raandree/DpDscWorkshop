# DpDscWorkshop

## Tagesziele

### Tag 1
- Rückblick und Schnelleinstieg zur Erinnerung. Wie benutzt man DSCWorkshop?
  - Sampler Concept
  - Sampler.DscPipeline
  - Datum vNext
    - Datum.InvokeCommand Handler
    - Variable Interpolation and cross-references
    - RSOP with yaml / layer source information
    - RSOP as source for MOF compilation
- Konfiguration der Build Pipeline mit Cache Feed für die PowerShell Module
- Bau der Office Online Server Config für das Intranet RZ (Test, Stage, Prod)
- Erzeugen der Konfiguration (OOS) und Deployment auf dem Pull Server (steht bereit)
- Office Online Server holen ihre Konfig vom Pull Server

Tag 2
-	Umgang mit Konfigurationskonflikten zwischen mit GPO und DSC:
Beispiel: Unser RZ gibt viele „User Rights Assignment“ Berechtigungen mittels GPO vor, die nach RZ Policy mit einer verfahrensspezifischen GPO bei Bedarf überschrieben werden kann.
-	Hier ist die Suche nach einem gangbaren Mittelweg gefragt. 
-	Transformation der SharePoint Server DSC Konfiguration auf ein DSCWorkshop kompatibles Format. Hier gibt es für mich eine Herausforderung mit den verketten Abhängigkeiten zwischen Ressourcen auf diversen Servern.

Tag 3
-	Transformation der SharePoint Server DSC Konfiguration auf ein DSCWorkshop kompatibles Format. Hier gibt es für mich eine Herausforderung mit den verketten Abhängigkeiten zwischen Ressourcen auf diversen Servern.

- Pull server registration fails (not authenticated)
