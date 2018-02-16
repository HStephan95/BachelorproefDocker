# Iteratie 2 - Installatie Dockerservers

- Student: Heirbaut Stephan
- Promotor: Steven Vermeulen
- Copromotor: Gert Schepens

## Vereisten

- Doel: Het installeren van Docker op een Windows- en Linuxomgeving
- Geschatte tijd: 29/01/2018
- Benodige tijd: 19/02/2018

## Test plan

|Objectief|Korte beschrijving|Behaald|
|---------|------------------|-------|
|Docker for Windows|Het opzetten van een Dockeromgeving op een Windows Server 2016||
|Docker for Linux|Het opzetten van een Dockeromgeving op een CentOS||
|Applicatie deployen|Het deployen van een applicatie met beide omgevingen||

## Documentation

AWS opgesteld als optie.

Virtualbox voorbeeld getoont.

Hyper-V saucen:
  - [gusztavvargadr/w16s Vagrant box](https://app.vagrantup.com/gusztavvargadr/boxes/w16s)

Scripts aanpassen:
  - Set-Executionpolicy
  - Stop/Start-Service
  - Scheiden scripts
  
Nog andere box.

Ssh problemen, terug naar vorige.

Connection string aanpassen (appsettings.json).

Pair programming.

Solo test : GS - 12/02/2018
--
wijzigingen aangebracht in originele vagrantfile van basebox.
 -	CPU's 1--> 2

Wijziging aan windows_reboot script 
- Sleep 5 --> 40
- comment out : remount syced folders

Reboot success!

Wijziging aan Docker-installp2 script
- Startservice verwijderen, start bij reboot.
--

Reload-plugin in plaats van reboot provision-plugin

Eerste keer installatie succesvol afgerond!

OpenSSH toevoegen via Chocolatey

Enviroment Variable, dus gewoon aanroepen

OpenSSH geïnstalleerd



## Test rapport



## Bronnen
### Vagrant

[Vagrant documentatie](https://www.vagrantup.com/docs/index.html)

[Vagrant boxes](https://app.vagrantup.com/boxes/search)

[Windows Server 2016 box aanpassen](https://app.vagrantup.com/mwrock/boxes/Windows2016)

[Vagrant reboot provision](https://github.com/exratione/vagrant-provision-reboot)

[Vagrant Reload plugin](https://github.com/aidanns/vagrant-reload)