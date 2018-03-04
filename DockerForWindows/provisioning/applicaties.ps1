#! /usr/bin/bash
# abort on nonzero exitstatus
#set -o errexit
# abort on unbound variable
#set -o nounset
# don't mask errors in piped commands
#set -o pipefail

#cd "C:\Users\P&G\Documents\BP-SH\DockerForWindows\sol10MvcInDepth\src\DienstenCheques"

#cd "C:\Users\vagrant"

#Get-ChildItem


#MS Equivalent

#Get-ChildItem -Directory

cd ../../Users/vagrant

#New-Item app -ItemType Directory

new-item ".\app\Dockerfile" -Force 

$DockerCommands = 'FROM microsoft/dotnet:2.0.5-sdk-2.1.4'
 $DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = 'WORKDIR /app'
$DockerCommands | Add-Content ".\app\Dockerfile"
$DockerCommands = "ADD 'C:/sol10MvcInDepth' ."
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


docker build -t sol10mvcindepth:myapp .

docker run -d -p 8080:5000 -t sol10mvcindepth:myapp
