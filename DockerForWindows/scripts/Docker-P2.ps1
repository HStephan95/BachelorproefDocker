#Start-Service $ServiceToStart


Get-Service -Name Docker


#Write-Host "#SHIT WENT DOWN HERE#"

Write-Host "PRE-INSTALL POSH DOCKER"
# Installeren posh-docker PowerShell module voor auto-completion
Install-Module posh-docker -Force

Write-Host "POST INSTALL POSH DOCKER"
# Enable auto-completion
Import-Module posh-docker

# Testen installatie
docker container run hello-world:nanoserver