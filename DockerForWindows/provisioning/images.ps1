Write-Host "#DOWNLOADING IMAGES#"
# download mssql image
docker pull microsoft/mssql-server-windows-developer

# download dotnet image
docker pull microsoft/dotnet:2.0.5-sdk-2.1.4
Write-Host "#IMAGES DOWNLOADED#"