# Naar directory gaan waarin het .csproj-bestand zit
sl ../../Users/vagrant/VoorbeeldProject/DienstenCheques

# Aanmaken app-folder, dockerfile en docker-compose.yml
Write-Host "#CREATING APP, DOCKERFILE EN DOCKER-COMPOSE.YML#"
New-item "dockerfile" -Force
New-item "docker-compose.yml" -Force 
New-Item "app" -ItemType Directory -Force

# Opvullen dockerfile
Write-Host "#FILLING DOCKERFILE#"
$DockerCommands = 'FROM microsoft/dotnet:2.0.5-sdk-2.1.4'
 $DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'WORKDIR /app'
$DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'COPY . /app'
 $DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'RUN dotnet restore'
 $DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'RUN dotnet build'
 $DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'EXPOSE 80/tcp'
 $DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'ENTRYPOINT ["dotnet", "run"]' 
 $DockerCommands | Add-Content "Dockerfile"

# Opvullen docker-compose.yml
# indentatie belangrijk!
Write-Host "#FILLING DOCKER-COMPOSE.YML#"
$ComposeCommand = 'version: "3"'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = 'services:'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '   web:'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '     build: .'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '     ports:'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '       - "8080:80"'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '     depends_on:'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '       - db'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '   db:'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '     image: "microsoft/mssql-server-linux"'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '     environment:'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '       SA_PASSWORD: "Vagrant123"'
 $ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = '       ACCEPT_EULA: "Y"'
 $ComposeCommand | Add-Content "docker-compose.yml"

# Bouwt de image
Write-Host "#BUIDLING IMAGE#"
docker-compose build

# Bouwt de container
Write-Host "#BUILDING CONTAINER#"
docker-compose up