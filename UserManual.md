# User manual

Deze repository bevat de nodige bestanden die 2 virtuele machines op stellen:

* CentOS 7.4 met Docker CE en docker-compose
* Windows Server 2016 met Docker for Windows

In deze opstellingen worden ook 2 containers gebouwd:

* een .NET webapplicatie en een MSSQL databank voorzien.
* een MSSQL databank

Hieronder staat kort beschreven hoe je deze opstellingen kan installeren en gebruiken.

## Vereisten

* Vagrant

De eerste vereiste is dat men naar [Vagrant](https://www.vagrantup.com/) gaat en de bestanden [download](https://www.vagrantup.com/downloads.html) en installeert.
Deze zullen nog zijn om de opstellingen te installeren via de Vagrant syntaxis.
Meer informatie over Vagrant vind je [hier](https://www.vagrantup.com/docs/index.html).

* CLI

Daarnaast is een minimale kennis van het werken in een CLI-omgeving vereist.
Omdat Vagrant geen GUI heeft, en je dus een CLI zal moeten gebruiken om de Vagrant commando's uit te voeren.
Vagrant ondersteund [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/getting-started-with-windows-powershell?view=powershell-6) en [Bash](https://www.gnu.org/software/bash/).

* Hypervisor

Vervolgens zal je een Hypervisor moeten installeren om de virtuele machines op te laten draaien.
Standaard kunnen beide opstellingen geïnstalleerd worden op [Virtual Box](https://www.virtualbox.org/)of [Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/).
Voor andere Hypervisors raadpleeg je best ![Vagrant Cloud](https://app.vagrantup.com/boxes/search) en kijk je of de ingestelde image jouw Hypervisor ondersteund.
Als je de image aanpast om jouw Hypervisor te ondersteunen kan ik niet 100% garanderen dat de opstelling nog zal werken.

* Git Bash (optioneel)

Daarnaast kun je optioneel, maar aangeraden, Git Bash installeren. Deze applicatie vermakkelijkt het downloaden van deze repository via de Git-commandos die hierop beschikbaar zijn. Het voorziet ook in één keer een Unix-CLI om in te werken.
Meer informatie over Git Bash vind je [hier](https://git-scm.com/about).

* Repository

Ten slotte, zal je deze repository nog moeten downloaden. Je kunt dit doen door Git Bash te gebruiken via `git clone <httpsurl>` of `git clone --config core.autocrlf=input <sshurl>`. Alternatief, kun je dit ook downloaden als een .ZIP-bestand.

## CentOS 7.4 met Docker CE

De eerste opstelling bevat CentOS 7.x met Docker CE en docker-compose.

### Installatie instructies

Als je bovenstaande vereisten in orde hebt gebracht kan je nu deze opstelling installeren.
Controleer als eerste even het Dockerfile-bestand en de 3 scripts.

#### Vagrantfile

Als eerste zijn er enkele standaardwaarden in het `Vagrantfile`-bestand waar u best even naar kijkt:

* Staat de gebruikte Hypervisor goed?
* Is het IP adres nog beschikbaar?
* Wilt u een andere (.NET) applicatie voorzien?

Pas deze aan waar nodig, maar hou er rekening mee dat dit nog verdere configuratie vereisten heeft in het `images.sh` en `applicaities.sh` script. Dus, let goed op en bekijk de documentatie van [Vagrant](https://www.vagrantup.com/docs/) en [Docker](https://docs.docker.com/) goed. Maak eventueel een issue aan als je hulp nodig hebt.

Verder kan het ook geen kwaad om na te gaan wat de naam en hostname van de virtuele machine zullen zijn.
Ten slotte kunt u meer of minder RAM en CPU's voorzien. Let wel op dat de MSSQL container een zekere hoeveelheid resources kan op eisen.

#### Scripts

Er worden 3 scripts uitgevoerd om deze opstelling te realiseren:

Het eerste is `Prereqs.sh`. Dit installeerd en configureerd alle vereisten die nodig zijn om voor deze opstelling, zoals: Epel-Release, Firewalld, Nano, Python-Pip, Docker, docker-compose en anderen.

Daarnaast heb je `images.sh`. Dit script bevat 2 korte commando's om de nodige images te pullen voor Docker.

Ten slotte is er nog `applicaties.sh`. Hierin wordt via docker-compose de .NET webapplicatie geïnstalleerd.

#### Instructies

In `prereq.sh` worden alle programma's geïnstalleerd die nodig zijn, zoals: Epel-Release, Git, Nano, Docker, docker-compose en anderen.

Ga met je CLI naar de directory `/CentOSDocker` en voer hier `vagrant up` uit.
Met dit commando zal Vagrant automatisch de server beginnen installeren. Er zal normaal geen verdere input meer nodig zijn, behalve als je Hyper-V gebruikt. Omdat Vagrant nog niet kan omhoog met de virtuele switch van Hyper-V.

### Post-installatie

Als de installtie gedaan is kun je met `vagrant ssh` in de virtuele machine kruipen om te kijken of de containers geïnstalleerd zijn met `docker ps`.
Waarna je de containerid kunt gebruiken om `docker inspect <containerid>` uit te voeren om die configuratie van de container te bekijken.
Vervolgens voer je in je browser, wget of Invoke-Webrequest `http://<ipvm>:8080` in en zul je de index pagina van de webapplicatie te zien krijgen.

## Windows Server 2016 met Docker for Windows
*TO DO