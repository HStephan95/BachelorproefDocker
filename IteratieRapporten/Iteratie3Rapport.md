# Iteratie X - XXXXX

## Vereisten

- Doel: Het afwerken van enkele onafgewerkte puntjes uit vorige iteraties en het uitzoeken van hoe het systeem op een methodologische manier getest kan worden.
- Van tijd: 05/03/2018
- Tot tijd: 25/03/2018

## Test plan

- Applicatie deployen
    - Overgeerft van iteratie 2. Het opzetten van een applicatie blijkt nog relatief lastig te zijn
- Transcript
    - Doel van deze iteratie is om het transcripts tot de inleiding volledig af is
- Testing
    - Uitzoeken van hoe alle verschillende testen uitgevoerd kunnen worden op een zo objectief mogelijke manier
- Documentatie
    - Updaten van de gebruikte bronnen
    - Updaten van de meeste gebruikte commando's

## Documentation
Algauw vonden we het probleem waarom de Dockerfile niet de applicatie niet kon aanmaken: de bronbestanden werden niet meegegeven tijdens de installatie en de container kan niet aan de host omdat deze afgesloten is van hetzelf netwerk. Wat normaal een positiefpunt is. Maar, daardoor geraakten we dus niet verder.

Om dit op te lossen hebben we eerst geprobeerd om via PowerShell de bronbestanden van de applicatie op de VM te krijgen. Maar, ook hier was de afgesloten natuur van een container het probleem.

We hebben uiteindelijk geopteerd om de bestanden mee te geven via Vagrant tijdens de provision-fase. Dit lukte bijna direct en hadden we eigenlijk direct aan moeten denken. Daarna moesten we alleen het pad nog op punt stellen en waren we weer een beetje verder.

Vervolgens kregen we een eerste BUILD-error van het .NET-project. Dit kwam omdat we een oudere (legacy) project van .NET gebruikten. We zijn dan beginnen zoeken achter eventuele nog ondersteunde legacy SDK's. Maar, we opteerden al vrij gauw voor het alternatief: Namelijk het zoeken naar een meer up to date project.

Hiervoor hebben we gebruik gemaakt van de Web3-repository die online staat van HoGent. Hieruit hebben we dan 2 applicaties gekozen die normaal perfect zouden moeten werken en zijn we daarmee aan de slag gegaan.

We hebben tijdens het deployen van dit project dan even kort de mogelijkheden van Compose besproken en of we dit zouden opnemen in het project. We gaan ons nu eest focussen op de kern en komen hier later op terug.

Het deployen van deze applicaties lukte wel. De VM installeerde perfect, de Dockerfile stond goed, de image paste bij de versie van het project en de DB-container en Web-container kwamen ook overeen. Alleen hebben we schijnbaar problemen met de poorten. Ondanks dat we bij `docker run` de optie `-p 8080:5000` meegaven en we vanuit de Docker Host een webrequest sturen naar 8080 krijgen we geen reactie.

Om dit op te lossen zal er nog een beetje opzoek werk nodig zijn. Maar, we vinden het op zijn minst verrassend. Zeker aangezien de Firewall normaal goed stond. Maar, zelfs nadat we deze volledig hadden uitgeschakeld zorge dit nog steeds voor probleem. Heel raar.

## Test rapport

|Objectief|Korte beschrijving|Behaald|
|---------|------------------|-------|
|Applicatie deployen|Applicatie is gedeployed. Duidelijk zichtbaar, maar nog problemen met deze te bereiken.|X|
|Transcript|Eerste transscript uitgezonden|X|
|Testing|Doordat we zodanig veel tijd in de applicatie hebben gestoken heb ik het test gedeelte nog niet kunnen opzoeken.||
|Documentatie|In orde, maar gaat beter opgevolgd moeten worden|X|

## Bronnen
[Published Ports On Windows Containers Don't Do Loopback](https://blog.sixeyed.com/published-ports-on-windows-containers-dont-do-loopback/)

[Port binding does not work for locahost #458](https://github.com/docker/for-win/issues/458)

[How to access containers by internal IPs 172.x.x.x #221](https://github.com/docker/for-win/issues/221)

[Can't reach Apache on Docker from Windows Server 2016 host machine](https://stackoverflow.com/questions/45188436/cant-reach-apache-on-docker-from-windows-server-2016-host-machine)

[Logs and troubleshooting](https://docs.docker.com/docker-for-windows/troubleshoot/#networking-and-wifi-problems-upon-docker-for-windows-install)

[The Basics of the Docker Run Command](https://blog.codeship.com/the-basics-of-the-docker-run-command/)

[Docker Tutorial Series — Part 2 : Basic Commands](https://rominirani.com/docker-tutorial-series-part-2-basic-commands-baaf70807fd3)

[How to get a Docker container's IP address from the host?](https://stackoverflow.com/questions/17157721/how-to-get-a-docker-containers-ip-address-from-the-host)

[Docker Explained: Using Dockerfiles to Automate Building of Images ](https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images)