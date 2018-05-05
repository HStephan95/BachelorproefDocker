# Iteratie X - XXXXX

## Vereisten

- Doel: De applicatie beschikbaar krijgen vanaf de Docker Host zodat de software tests uitgevoerd en verwerkt kunnen worden. Alsook het verder documenteren van de gebruikte technologie en hiervan een 2de transscript opleveren aan Mr Vermeulen, Mr Schepens en Mevr Brewee.
- Van tijd: 26/03/2018
- Tot tijd: 06/05/2018

## Test plan
- Applicatie afwerken
    - De applicatie bereikbaar maken
- Eerste fase software testing
    - Eerste poging ondernemen om een software test uit te voeren
- Transscript
    - 2de transscript afleveren aan Mr Vermeulen, Mr Schepens en Mevr Brewee
- Documentatie
    - Up to date houden van de documentatie


## Documentation
Als eerste hebben we opgezocht of het probleem eventueel bij `EXPOSE` lag. Maar, blijkbaar is dit commando geheel ter documentatie. Wanneer je `docker run` uitvoerd met het de `-p 8080:5000` doe je eigenlijk aan port-forwarding.

Dit werd bevestigd door het gebruik van `docker inspect <containerid>`. Hiermee kregen we een JOSN-array te zien met alle informatie van de draaiende container en zover we zagen klopte alles erin.

Daarnaast hebben de optie `-P` ook eens geprobeerd maar dit leverde ook geen succes op.

Ten slotte probeerde we het op een meer conservatieve manier met `-p 8080:80`. Maar, de applicatie bleef even goed onbereikbaar.

Mr Schepens en ik zijn daarom beginnen zoeken in hoeverre de container onbereikbaar was door de TCP/IP stack te doorlopen.

Een eerste `ping` commando naar de VM vanaf onze laptops ging zonder problemen en de routes op de WS 2016 zagen er ook goed uit. Een DNS query was niet echt van toepassing, aangezien we direct naar een IP-adres surften.
De ping en routes naar de container faalden of waren er niet. Dit zorgde voor een paar alarmbellen. Maar, je kunt een container niet pingen zonder eerst een route ernaar te specifieren.

Vervolgens controleerden we de firewall. Waarbij we eerst de poorten toevoegden en daarna de firewall zelfs volledigen uitschakelden. De VM is nog steeds bereikbaar maar de applicatie niet.

Ten slotte hebben we wget gebruikt om de web applicatie te testen maar weer kregen we geen reactie en op de logs was er zelfs geen request te vinden.

Conclusie: zowel extern (vanop de laptops) als intern (docker host vm) konden we geen web requests sturen naar de container. We denken dat dit komt door de poort, maar we zien beiden niet waarom.

Om dit te onderzoeken haalden we daarom onze 2de server erbij: de CentOS 7.4 opstelling. Maar, hier kregen we dezelfde problemen. De applicatie deployed 'perfect', maar is niet beschikbaar. Het probleem lag dus niet aan Windows, de poorten of de firewall. Maar, aan iets anders? Misschien dat er nog een extra route handmatig moet worden toegevoegd?

Als laatste poging hebben we de 2de applicatie geprobeerd. Maar, dit leverde gewoon hetzelfde probleem op.

Hierdoor hebben we weeral geen software testing kunnen doen en begint er een zekere tijdsdruk op te bouwen. Want, zonder het testgedeelte zal ik gebrek aan data hebben om mee te werken. Immers, zolang de applcatie geen web requests kan ontvangen kan ik geen veiligheid of integratie tests doen.

Daarom heb ik op StackOverflow een vraag gesteld om te kijken of er iemand is die dit probleem ook al heeft gehad en eventueel een antwoord heeft. Daarnaast heb ik ook Mr Bert Van Vreckem gecontacteerd.

Dit probleem werd dan nog verergerd doordat ik een rollback heb moeten doen, omdat ik te lang heb gewacht met het committen van alle veranderingen. Waardoor ik een verkeerde commit heb toegevoegd die ik niet meer kon verwijderen.

Het schrijven vlot dan weer aardig. De literatuurstudie is zo goed als af. Alleen de methodologie en het onderzoek naar de documentatie moet nog bijgewerkt worden. Zodra de testresultaten binnen zijn, kan ik deze dan ook verwerken en opnemen in mijn BAP en is deze af.

Hopelijk krijg ik via Mr Van Vreckem of op StackOverflow gauw reactie zodat ik toch nog tijdig de testresultaten kan krijgen.

## Test rapport

|Objectief|Korte beschrijving|Behaald|
|---------|------------------|-------|
|Applicatie|De applicatie is nog steeds niet bereikbaar ondanks verschillende pogingen||
|Software testing|Omdat de applicatie niet geïnstalleerd is geraakt zijn er ook nog geen tests uitgevoerd kunnen worden||
|Transscript|Een 2de transscript is wel opgeleverd kunnen worden. Deze vlot goed, alleen de test resultaten nog.|X|
|Documentatie|Documnetatie is up to date, maar dient uitgewerkt te worden.|X|

## Bronnen
[Docker Compose](https://docs.docker.com/compose/)

[Permission denied - C:/Windows/system32/drivers/etc/hosts (Errno::EACCES) #89](https://github.com/cogitatio/vagrant-hostsupdater/issues/89)

[Net.bridge.bridge-nf-call and sysctl.conf](https://wiki.libvirt.org/page/Net.bridge.bridge-nf-call_and_sysctl.conf)

[Identifying open and closed server IP Address/ports](https://unix.stackexchange.com/questions/11756/identifying-open-and-closed-server-ip-address-ports)

[How could I ping my docker container from my host](https://stackoverflow.com/questions/39216830/how-could-i-ping-my-docker-container-from-my-host)