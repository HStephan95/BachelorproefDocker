# SOURCE: https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH
Set-Location C:\Users\vagrant\OpenSSH-Win64

# Installeren OpenSSH
Write-Host "#INSTALLING OPENSSH#"
powershell.exe -File install-sshd.ps1
Write-Host "#OPENSSH INSTALLED#"

# Adding firewall rule
Write-Host "#ADDING FIREWALL RULE#"
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22
Write-Host "#FIREWALL RULE SET#"

# STARTING SSHD
net start sshd


# Setup startup types voor OpenSSH services
Write-Host "#SETTING STARTUP TYPES FOR SERVICES OF OPENSSH#"
Set-Service sshd -StartupType Automatic
Set-Service ssh-agent -StartupType Automatic 
Write-Host "#OPENSSH SERVICES SETUP#"