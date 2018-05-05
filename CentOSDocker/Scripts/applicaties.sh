#! /usr/bin/bash
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't mask errors in piped commands
set -o pipefail

# Going to the directory which contains de .csproj-file
cd /home/vagrant/VoorbeeldProject/DienstenCheques

# cd /home/vagrant/09solSportsStore-master/SportsStore

# Creates dockerfile
echo "Creating dockerfile"
cat > Dockerfile << EOF 
FROM microsoft/dotnet:2.0.5-sdk-2.1.4

RUN mkdir -p /app

WORKDIR /app

COPY . /app

RUN dotnet restore

RUN dotnet build

EXPOSE 5000/tcp

ENV ASPNETCORE_URLS http://*:5000

ENTRYPOINT ["dotnet", "run"]
EOF

# Creates docker-compose.yml
echo "Creating docker-compose-yml"
cat > docker-compose.yml << EOF 
version: "3"

services:
  web:
    build: .
    ports:
      - "8080:5000"
    depends_on:
      - db
  db:
    image: "microsoft/mssql-server-linux"
    environment:
      SA_PASSWORD: "Vagrant123"
      ACCEPT_EULA: "Y"
EOF

# Building image
echo "Building docker image"
docker-compose build

# Running container
echo "Building container"
docker-compose up