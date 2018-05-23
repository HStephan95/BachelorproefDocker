net start com.docker.service

# Installeren Pip
Write-Host "#INSTALLING PYTHON/PIP#"
choco install -y python2
setx PATH "$env:path;C:\tools\python2;C:\tools\python2\Scripts" -m
$env:path += ";C:\tools\python2;C:\tools\python2\Scripts"
choco install pip

# Testen installatie
Write-Host "#RUN TEST CONTAINER#"
docker container run hello-world:nanoserver

# Toevoegen poorten voor Docker
Write-Host "#ADDING FIREWALL RULES#"
netsh advfirewall firewall add rule name=mssqlin dir=in action=allow protocol=TCP localport=1433
netsh advfirewall firewall add rule name=mssqlout dir=out action=allow protocol=TCP localport=1433

netsh advfirewall firewall add rule name=dockerappin dir=in action=allow protocol=TCP localport=8080
netsh advfirewall firewall add rule name=dockerappout dir=out action=allow protocol=TCP localport=8080

netsh advfirewall firewall add rule name=httpin dir=in action=allow protocol=TCP localport=80
netsh advfirewall firewall add rule name=httpout dir=out action=allow protocol=TCP localport=80

netsh advfirewall firewall add rule name="docker engine" dir=in action=allow protocol=TCP localport=2375