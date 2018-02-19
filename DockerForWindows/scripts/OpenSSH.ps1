# Installeren OpenSSH
Write-Host "#INSTALLING OPENSSH#"
powershell.exe install-sshd.ps1
Write-Host "#OPENSSH INSTALLED#"

# Adding firewall rule
Write-Host "#ADDING FIREWALL RULE#"
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22
Write-Host "#FIREWALL RULE SET#"

# Setup startup types voor OpenSSH services
Write-Host "#SETTING STARTUP TYPES FOR SERVICES OF OPENSSH#"
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic 
Write-Host "#OPENSSH SERVICES SETUP#"