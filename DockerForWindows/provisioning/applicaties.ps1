
cd ../../Users/vagrant

new-item ".\app\Dockerfile" -Force 

$DockerCommands = 'FROM microsoft/dotnet:2.0.5-sdk-2.1.4'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'WORKDIR \app'
$DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'COPY voorbeeldproject .\app'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'RUN dotnet restore'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'RUN dotnet build'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'EXPOSE 5000/tcp'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'ENV ASPNETCORE_URLS http://*:5000'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'ENTRYPOINT ["dotnet", "run"] ' 
 $DockerCommands | Add-Content ".\app\Dockerfile"

cd ../../Users/vagrant/app

docker build -t voorbeeldproject:myapp .

docker run -d -p 8080:5000 -t voorbeeldproject:myapp

#>