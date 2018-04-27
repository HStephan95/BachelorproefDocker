
#paswoord variabele
$password = "Vagrant123"

docker pull microsoft/mssql-server-windows-developer

docker run -d -p 1433:1433 -e sa_password=$password -e ACCEPT_EULA=Y microsoft/mssql-server-windows-developer
