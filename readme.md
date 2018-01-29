# Bachelorproef: Docker for Windows

- Student: Stephan Heirbaut
- Co-promotor: Gert Schepens
- Promotor: Steven Vermeulen

## Samenvatting

Docker for Windows Server 2016 is beschikbaar sinds september 2016, maar het heeft nog geen doorbraak gehad bij de DevOps. Dit ondanks het feit dat het een krachtige tool is voor hen, zeker als men ook een Microsoft Certified Partner wil zijn. Het voorstel van deze bachelorproef is om een onderzoek uit te voeren naar hoe krachtig Docker kan zijn op een Windows Server 2016, teneinde zo meer opties te hebben om deze technologie te deployen.

Er zal dus een opstelling gebeuren van een Windows Server 2016 en een CentOS server met Docker, waarbij beiden de taak zullen krijgen om dezelfde applicaties te deployen. De verwachting is dat Docker het op beide platformen er even goed van af brengt, maar ook dat er zeker nog werk aan de winkel is op vlak van documentatie. 

DevOps is namelijk een groeiend principe, en terecht. Hoe meer opties zij dus hebben, hoe beter.

## State of the art

Er werden reeds verschillende tests uitgevoerd met Docker, [An introduction to Dockerfor reproducible research, with examples from the Renvironment](https://arxiv.org/abs/1410.0846), waarin het gebruikt werd om makkelijk reproduceerbaar onderzoek uit te voeren. In de conclusie worden verschillende best practices voorgesteld.

Er zal in deze bachelorproef onderzocht worden in hoeverre het mogelijk is om deze na te bootsen op een Windows Server. Het uiteindelijke doel is om te proberen de volledige opstelling te repliceren.

Een andere studie, [Docker and Container Security White Paper](http://domino.watson.ibm.com/library/CyberDig.nsf/1e4115aea78b6e7c85256b360066f0d4/040f7f7d5e62f0e58525804500433733!OpenDocument&Highlight=0,RC25625), heeft ook al de voordelen besproken van het werken met containers op vlak van beveiliging, zoals bijvoorbeeld Sandboxing. Ook dit is een goede studie om te proberen reproduceren in de Windows omgeving, echter met een grotere uitdaging. In hun conclusie vermeldt men vooral cgroups en SELinux, functies die uniek voor Linux bestaan. Er zal dus onderzocht worden hoe deze nagebootst kunnen worden op een Windows Server.

Verder zal in deze bachelorproef de beschikbare literatuur ook grondig worden getest, aangezien Docker nog maar sinds september 2016 beschikbaar is voor Windows en dat deze misschien nog dient te worden bijgewerkt. De belangrijkste officiële bronnen hiervoor zijn: 

  - [Docker for Windows Server](https://www.docker.com/docker-windows-server#/)
  - [Introducing Docker for WindowsServer 2016](https://blog.docker.com/2016/09/dockerforws2016/)
  - [Windows Containers on Windows Server](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quickstart-windows-server)
  
Deze zullen één voor één bekeken en getest worden op hun compleetheid.

## Plan van aanpak 

### Tools

1. [GitHub repo](link)
2. [Discord](link)
3. [Teamviewer](link)
4. [AWS](link)
5. [VirtualBox](link)
6. [Hyper-V](link)
7. [Vagrant](link)
8. [Brackets](link)
9. [Docker](link)

### Afspraken

*to do*

### Iteraties

1. Literatuurstudie:
  - Docker (Windows/Linux)
  - Containers (Sandboxing)
  - Beveiliging
  - Documentatie
2. Installatie Dockerservers
3. 
4. Testen:
  - Integratietesten
  - Performatietesten
  - Beveiligingstesten
5. Besluit