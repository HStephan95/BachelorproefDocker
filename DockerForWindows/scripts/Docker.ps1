# Aanpassen Windows PowerShell execution policy naar onbeperkt
Set-ExecutionPolicy Unrestricted 

# Installeren Docker
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force

# Start Docker
Start-Service Docker

# Installeren posh-docker PowerShell module voor auto-completion
Install-Module posh-docker

# Enable auto-completion
Import-Module posh-docker

# Testen installatie
docker container run hello-world:nanoserver