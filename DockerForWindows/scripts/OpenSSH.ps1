Write-Host "installing OpenSSH Services"

powershell.exe install-sshd.ps1

Write-Host "adding firewall rule to allow ssh in "
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22

Write-Host "setting startup types for services of OpenSSH"
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic 

