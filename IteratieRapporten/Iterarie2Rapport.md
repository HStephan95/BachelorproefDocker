# Iteratie 2 - Installatie Dockerservers

- Student: Heirbaut Stephan
- Promotor: Steven Vermeulen
- Copromotor: Gert Schepens

## Vereisten

- Doel: Het installeren van Docker en een applicatie ermee op een Windows- en Linuxomgeving
- Geschatte tijd: 29/01/2018
- Benodige tijd: 19/02/2018

## Test plan

- Docker for Windows
     - Het opzetten van een Docker-omgeving op een Windows Server 2016
- Docker for Linux
     - Het opzetten van een Docker-omgeving op een CentOS 7.4.
- Applicatie deployen
    - Het schrijven van een Dockerfile zodat deze gebruikt kan worden om één en dezelde applicatie te deployen op beide servers

## Documentation

Als eerste had de copromotor al enkele voorstellen klaar voor het deployen van de Dockerserver, zowel voor Windows als Linux:
AWS werd voorgesteld als platform. Aangezien dit één van de populairdere platforms is voor DevOps en bovendien een sterke gratis formule heeft, waar we dan praktisch gebruik van zouden kunnen maken.
Hierbij heb ik dan direct een korte inleiding gekregen van de mogelijkheden van het platform en praktische kanten ervan.

Hierna heb ik hem nog een andere optie voorgesteld:
Een basisopstelling maken met Vagrant. Dit gebruikt Infrastructure as Code, waardoor we gewoon Vagrant-files en enkele scripts voor Linux en  Windows moesten aanmaken waarna we deze dan zouden kunnen delen via de GitRepo.
Dit heeft als voordeel het simuleren van een automatische deployment, die zo belangrijk zijn voor DevOps.


Na een korte inleiding van beide en de voordelen en nadelen besproken te hebben ervan hebben besloten om voor Vagrant te gaan. Vooral voor het automatisch deployen.
Al snel besloten we ook om aan Pair Programming te doen, aangezien tweemaal hetzelfde doen tegelijk vrij nutteloos was. Zeker als het uiteindelijk naar dezelfde repo werdt gepushed.


Vervolgens hebben we er een voorbeeld bij genomen van een eerdere Docker-opstelling die ik al eens gemaakt had op Linux.
Zo konden we al eens de essentie van de zaak bekijken.


Daarna zijn we begonnen aan de opstelling van Docker for Windows:
Als eerst hebben de eerder gevonden bronnen te geraadpleegt voor het opstellen van het Vagrant-bestand en de nodige PowerShell-scripts aan te maken.
Al snel stoten we op enkele problemen die men niet zou tegenkomen bij handmatige installatie, maar bij onze automatische opstelling dus wel.

Het eerste dat we oplosten was de Vagrant-box. Deze bleek niet geschikt genoeg en hebben we dus dan ook direct verandert voor [gusztavvargadr/w16s Vagrant box](https://app.vagrantup.com/gusztavvargadr/boxes/w16s).
Hierna ging de installatie al een pak vlotter, maar wel niet meer 100% automatisch.

Daarna zijn we de PowerShell scripts beginne troubleshooten. Onder andere:
    - Set-Exectionpolicy is in essentie niet nodig, omdat default uitvoermethode `BYPASS` is
    - Windows Server vereist een reboot na de installatie. Dit wouden we oplossen aan de hand van een plug-in, maar deze werkte nog niet feilloos.
    - Hierdoor hebben we bepaalde functionaliteit gescheiden
    
Waardoor we even geprobeert hebben of we al deze problemen niet konden oplossen door nóg een betere box te vinden.
Maar, we ondervonden al snel dat het niet daaraan lag en zijn we dus teruggegaan naar de 2de.

Na deze kinks in de installatie te hebben uitgewerkt zagen we ook dat `vagrant ssh` niet ging. Dit word op de 'to-do'-lijst gezet, want het heeft momenteel nog geen al te grote prioriteit

--

Op 12/02 heeft mr. Schepens dan even solo verder gewerkt, zonder mij, aan de opdracht. Hij wou nog enkele dingen verder uitwerken en testen die misschien nog zouden kunnen werken.
Hierna heeft hij verslag uitgebracht aan mij de volgende keer dat we samen zaten:
- Hij heeft zijn basebox aagepast van 1 naar 2 cores. Deze performantie verhoging door een kleine aanpassing is zeker de moeite waard om mee te nemen.
- Hij heeft ook enkele wachttijden in het script gestoken voor het bevorderen van rebooten.
- Hij heeft verder nog enkele problemen gevonden bij `remount synced folders`. Deze zullen we nog verder moeten bekijken.
- Hij heeft tenslotte nog de commandlet `start-service` verwijdert, aangezien de daemon nu automatisch wakker wordt en dus overbodig is.

--

Het probleem van het heropstarten hebben we tijdens deze sessie ook kunnen oplossen! Waardoor er direct een groot obstakel van de baan is.
We hebben geopteerd voor een meer robuuste variant van de plug-in. Waardoor de reboot nu wordt aangeroepen vanuit Vagrant zelf en niet geforceerd vanuit het OS.
Hierdoor konden voor de eerste keer de installatie volledig vanaf nul automatisch afronden zonder problemen. Docker for Windows is geïnstalleerd!

Vervolgens hebben het SSH-probleem aangemaakt door via Chocolatey OpenSSH toe te voegen. Met deze packagemanager voor Windows blijft onze installatie ook volledig automatisch verder werken.
Want, we ontdekten dat we hierna de Enviroment Variabele konden aanroepen die Docker toevoegt aan de installatie.

Hierna gingen we al een stap verder en deployden we een eerste container met MSSQL.
Aan de hand van de gevonden bronnen ging deze installatie vrij vlot. We hebben alleen nog de gebruikte `images` van [Docker Hub](https://hub.docker.com/) moeten aanpassen.

Dockerfile layout overnemen en aanpassen.
CD problemen
WORKDIR problemen
COPY/ADD problemen `//?/`

## Test rapport

Ook hier is er weer een streefdoel dat ik zal moeten meenemen naar de volgende iteratie. Want, hoewel we een Linux- en Windowsomgeving voor Docker hebben kunnen uitrollen, had ik helaas niet genoeg tijd om samen te zitten met mr. Schepens om de applicatie nog rond te krijgen.
Maar, in het algemeen ben ik wel tevreden met het resultaat. Het laatste streefdoel is niet al te ver meer en we hebben al ideeën hoe we het kunnen bereiken en er zelfs op kunnen verbeteren.

|Objectief|Korte beschrijving|Behaald|
|---------|------------------|-------|
|Docker for Windows|Het opzetten van een Dockeromgeving op een Windows Server 2016|X|
|Docker for Linux|Het opzetten van een Dockeromgeving op een CentOS|X|
|Applicatie deployen|Het deployen van een applicatie met beide omgevingen||

## Bronnen
### Vagrant

[Vagrant documentatie](https://www.vagrantup.com/docs/index.html)

[Vagrant boxes](https://app.vagrantup.com/boxes/search)

[Windows Server 2016 box aanpassen](https://app.vagrantup.com/mwrock/boxes/Windows2016)

[Vagrant reboot provision](https://github.com/exratione/vagrant-provision-reboot)

[Vagrant Reload plugin](https://github.com/aidanns/vagrant-reload)

[Dockercontainers for Windows](https://docs.microsoft.com/en-us/virtualization/windowscontainers/manage-docker/manage-windows-dockerfile)

[Dockerbuild](https://docs.docker.com/engine/reference/commandline/build/#examples)

[Deploying a .Net-application](https://stormpath.com/blog/tutorial-deploy-asp-net-core-on-linux-with-docker)