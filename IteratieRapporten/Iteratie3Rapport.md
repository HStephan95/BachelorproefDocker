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

Eerste hebben we geprobeerd om via PowerShell of andere doeleinden de bronbestanden van de applicatie op de VM te krijgen. Dit tevergeefs. Het is té afgesloten van het systeem. Wat normaal een positiefpunt is. Maar, hiermee geraken we natuurlijk niet verder.

We hebben uiteindelijk geopteerd om het bestand mee te geven tijdens de provision-fase. Dit lukte bijna direct. Alleen moesten we het pad nog op punt stellen. Maar, dit is bijzaak die rap recht getrokken werd.

Hierna kregen we een eerste BUILD-error van het .NET-project. Dit kwam omdat we een oudere legacy manier van .NET gebruikten. We zijn dan beginnen zoeken achter eventuele nog ondersteunde legacy SDK's. Maar, we opteerden al vrij gauw voor het alternatief: Namelijk het zoeken naar een meer up to date project.

Dit konden we vinden van de HoGent Web3 GitHub repository. Hier vonden we een volledig project dat klaar was om te deployen.

We hebben tijdens het deployen van dit project dan even kort de mogelijkheden van Compose besproken en of we dit zouden opnemen in het project. We gaan ons nu eest focussen op de kern en komen hier later op terug.

## Test rapport

|Objectief|Korte beschrijving|Behaald|
|---------|------------------|-------|
|Applicatie deployen|Applicatie is gedeployed. Duidelijk zichtbaar, maar nog problemen met deze te bereiken.||
|Transcript|Eerste transscript uitgevonden|X|
|Testing|Opgezocht en genoteerd.|X|
|Documentatie|In orde, maar gaat beter opgevolgd moeten worden|X|

## Bronnen

