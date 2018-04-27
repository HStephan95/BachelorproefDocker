Write-Host "#PRE-INSTALL POSH DOCKER#"
# Installeren posh-docker PowerShell module voor auto-completion
Install-Module posh-docker -Force
Write-Host "#POSH DOCKER INSTALLED#"

Write-Host "#IMPORT POSH DOCKER#"
# Enable auto-completion
Import-Module posh-docker
Write-Host "#POSH DOCKER IMPORTED#"

# Testen installatie
Write-Host "#RUN TEST CONTAINER#"
docker container run hello-world:nanoserver

# Toevoegen poorten voor Docker
netsh advfirewall firewall add rule name=mssqlin dir=in action=allow protocol=TCP localport=1433
netsh advfirewall firewall add rule name=mssqlout dir=out action=allow protocol=TCP localport=1433

netsh advfirewall firewall add rule name=dockerappin dir=in action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name=dockerappout dir=out action=allow protocol=TCP localport=8080

netsh advfirewall firewall add rule name=httpin dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name=httpout dir=out action=allow protocol=TCP localport=80