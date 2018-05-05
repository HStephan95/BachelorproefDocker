sl ../../Users/vagrant/VoorbeeldProject/DienstenCheques

New-item "Dockerfile" -Force
New-item "docker-compose.yml" -Force 
New-Item "app" -ItemType Directory -Force

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

$ComposeCommand = 'version: "3"'
$ComposeCommand | Add-Content "docker-compose.yml"
$ComposeCommand = 'services:'
$ComposeCommand = '   web:'
$ComposeCommand = '     build: .'
$ComposeCommand = '     ports:'
$ComposeCommand = '       - "8080:80"'
$ComposeCommand = '     depends_on:'
$ComposeCommand = '       - db'
$ComposeCommand = '   db:'
$ComposeCommand = '     image: "microsoft/mssql-server-linux"'
$ComposeCommand = '     environment:'
$ComposeCommand = '       SA_PASSWORD: "Vagrant123"'
$ComposeCommand = '       ACCEPT_EULA: "Y"'

docker-compose build

docker-compose up