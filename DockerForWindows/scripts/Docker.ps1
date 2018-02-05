# Aanpassen Windows PowerShell execution policy naar onbeperkt
$CurrentPolicy = get-ExecutionPolicy

Write-Host "CURRENT POLICY IS $CurrentPolicy"

if($CurrentPolicy -ne "Bypass")
{
    Write-Host "SETTING CURRENT POLICY TO Bypass"
    Set-ExecutionPolicy Bypass
}


# Installeren Docker
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force

# Start Docker
#Start-Service Docker

# Installeren posh-docker PowerShell module voor auto-completion
Install-Module posh-docker

# Enable auto-completion
Import-Module posh-docker

# Testen installatie
docker container run hello-world:nanoserver