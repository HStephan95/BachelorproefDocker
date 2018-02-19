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