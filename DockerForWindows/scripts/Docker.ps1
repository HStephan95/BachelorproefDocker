
<#
# Aanpassen Windows PowerShell execution policy naar onbeperkt
$CurrentPolicy = get-ExecutionPolicy

Write-Host "CURRENT POLICY IS $CurrentPolicy"

if($CurrentPolicy -ne "Bypass")
{
    Write-Host "SETTING CURRENT POLICY TO Bypass"
    Set-ExecutionPolicy Bypass
}

Write-Host "#GOING to INSTALL DOCKER#"
# Installeren Docker
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force
Write-Host "#GOING to START DOCKER#"
# Start Docker
$ServiceToStart = Get-Service -Name Docker

$ServiceToStart

Start-Service $ServiceToStart

Start-Sleep -Seconds 5

Get-Service -Name Docker

Start-Sleep -Seconds 5

Write-Host "#SHIT WENT DOWN HERE#"

#>

# Installeren posh-docker PowerShell module voor auto-completion
Install-Module posh-docker

# Enable auto-completion
Import-Module posh-docker

# Testen installatie
docker container run hello-world:nanoserver