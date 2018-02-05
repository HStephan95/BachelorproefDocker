Start-Service $ServiceToStart

Start-Sleep -Seconds 5

Get-Service -Name Docker

Start-Sleep -Seconds 5

Write-Host "#SHIT WENT DOWN HERE#"


# Installeren posh-docker PowerShell module voor auto-completion
Install-Module posh-docker

# Enable auto-completion
Import-Module posh-docker

# Testen installatie
docker container run hello-world:nanoserver