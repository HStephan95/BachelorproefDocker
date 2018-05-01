#! /usr/bin/bash
# abort on nonzero exitstatus
set -o errexit
# abort on unbound variable
set -o nounset
# don't mask errors in piped commands
set -o pipefail

#paswoord variabele
password=Vagrant123

export ACCEPT_EULA=Y
export SA_PASSWORD=$password

docker run -e 'ACCEPT_EULA' -e 'SA_PASSWORD' -p 1433:1433 -d microsoft/mssql-server-linux

cd /home/vagrant/VoorbeeldProject/DienstenCheques

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

docker-compose build

docker-compose up