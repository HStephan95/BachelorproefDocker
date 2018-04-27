docker pull microsoft/dotnet:2.0.5-sdk-2.1.4

cd ../../Users/vagrant/VoorbeeldProject/DienstenCheques

new-item "Dockerfile" -Force 
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
$DockerCommands = 'ENV ASPNETCORE_URLS http://*:80'
 $DockerCommands | Add-Content "Dockerfile"
$DockerCommands = 'ENTRYPOINT ["dotnet", "run"] ' 
 $DockerCommands | Add-Content "Dockerfile"

docker build -t voorbeeldproject:myapp .

docker run -d -p 80:80 -t voorbeeldproject:myapp
