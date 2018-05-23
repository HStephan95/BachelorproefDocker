# Iteratie X - XXXXX

## Vereisten

- Doel: De applicatie beschikbaar krijgen vanaf de Docker Host zodat de software tests uitgevoerd en verwerkt kunnen worden.
- Geschatte tijd: 07/05/2018
- Benodige tijd: 27/05/2018

## Test plan
- Applicatie afwerken
    - De applicatie bereikbaar maken
- Eerste fase software testing
    - Eerste poging ondernemen om een software test uit te voeren
- Transscript
    - 3de transscript afleveren aan Mr Vermeulen, Mr Schepens en Mevr Brewee
- Bachelorproef afwerken
    - De feedback verwerken van het 3de transscript en het indienen van de BAP.

## Documentation

Doordat Meneer Schepens en ik totaal geen idee meer hadden waar we naartoe moesten heb ik een mail verstuurd naar één van mijn docenten: meneer Bert Van Vreckem, docent (Enterprise) Linux. Meneer Van Vreckem heeft in het verleden mijn klas al laten kennis maken met Docker en deze bachelorproef is ook gedeeltelijk zijn idee.

Daarnaast heb ik op StackOverflow ook een topic aangemaakt met mijn probleem en een gedetailleerde uitleg rond. Hopelijk krijg ik daar ook nog feedback op.

Kort daarna kreeg ik gelukkig al reactie van meneer Van Vreckem. Hij vroeg of ik niet eerst even een korte user manual kon maken voor hem. Want, de repository is ondertussen al vrij groot en gevuld met veel projecten.

Nadat ik deze had aangemaakt kon hij al eens kort kijken naar wat het probleem was. Buiten enkele dingen waar ik op moeten (absolute paden, hoofd- en kleine letters), merkte meneer Van Vreckem al snel op dat er iets niet klopte op vlak van poortverwijzing langs de kant van de applicatie.

Wat op zich wel raar was, want normaal stelde we deze in orde via [de environment variable van ASPNET.CORE](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/hosting?view=aspnetcore-2.0&tabs=aspnetcore2x). Meneer Van Vreckem heeft dan getoond hoe je deze kon hardcoden in de applicatie waarmee het probleem was opgelost.

Hiervoor moest ik in Program.cs BuildWebHost aanpassen.

Daardoor kon ik eindelijk de eerste paar performantietests uitvoeren: hoe lang het duurt om het systeem vanaf nul naar een draaiende webapp container te krijgen. Dit is vrij makkelijk te testen, doordat ik gewoon `time vagrant up` moet uitvoeren. Deze returned dan op het einde hoe lang het geduurd heeft om alles in orde te brengen. Als 2 waarde kan ik ook nog `time vagrant provision` gebruiken om te testen hoelang Docker nodig heeft om de applicatie te deployen. Hierdoor kan ik dan de tijd die er nodig is om de images te downloaden schrappen en zo een 2de onafhankelijke meting uitvoeren en bespreken.

De veiligheidstests kan ik baseren op welke security features CentOS heeft, zoals SELinux, Firewalld en Groups en er Windows alternatieven voor zoeken. Hierdoor zal dit minder kwantitatief zijn. Maar, wel nog steeds methodologisch.

De echte uitdagig zal de integratietests zijn. Hierbij moet ik het systeem in zijn geheel testen op hoe goed het samenwerkt met alle verschillende modules. Hiervoor bestaan er ook frameworks en modules. Maar, door mijn beperkte ervaring en tijdslimiet zullen deze moeilijk zijn om te gebruiken. Misschien moet ik hiervoor contact opnemen met mevrouw Karine Samyn, docent Webapplicaties 3.

Ondertussen zat ik natuurlijk niet stil en heb ik docker-compose toegevoegd aan de BAP, alsook het hoofdstuk omtrent de opstellingen bijgewerkt.

Eventueel twijfel ik nu nog om een korte uitleg omtrent Virtual Box erbij te plaatsen. Aangezien ik deze nu ook ondersteun als alternatief in mijn opstelling.

Windows opstelling faalt soms, CentOS stabiel

Maandag 21/05 laatste transscript

Pip installeren

Docker-compose via Pip met bat

Andere MSSQL image

Docker-compose file aanpassen met netwerk

Docker netwerk herstarten

Meer resultaten

Windows veel langer: GUI, SQL zwaarder en herstarten

Teleurstellend

## Test rapport

"Door het lezen van het testrapport moet het duidelijk zijn in hoeverre de opdracht is uitgevoerd, wat het effectieve resultaat van de tests was. Je kan transcripties toevoegen van de terminal (gebruikhiervoor Markdown codeblokken). Het testrapport zou evenveel informatie moeten bevatten als de demo."

|Objectief|Korte beschrijving|Behaald|
|---------|------------------|-------|
|Applicatie|De applicatie kan web requests ontvangen en verwerken|X|
|Software testing|De applicatie op een methodologische manier testen||
|Transscript|Voorlaaste transscript|X|
|BAP|Laatste feedback van transscript verwerken en indienen||

## Bronnen
