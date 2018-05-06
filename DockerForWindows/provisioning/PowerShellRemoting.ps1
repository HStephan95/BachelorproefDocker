# ENABLE PSREMOTING
Enable-PSRemoting -SkipNetworkProfileCheck -Force
Set-WSManQuickConfig
Set-Item wsman:\localhost\client\trustedhosts 192.168.56.16
Restart-Service WinRM

# TEST CONNECTION
Test-WSMan -ComputerName 192.168.56.16

# START CONNECTION
Enter-PSSession -ComputerName 192.168.56.16 -Port 55985
Connect-PSSession -ComputerName 192.168.56.16 -Port 55985

# DISABLE PSREMOTING
Disable-PSRemoting -Force
Stop-Service WinRM
Set-Service -Name winrm -StartupType Disabled
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 0 -Type DWord
winrm enumerate winrm/config/listener
winrm delete winrm/config/listener?address=*+transport=HTTP

# SOURCES
<#
ENABLING
https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/understanding-powershell-remote-management/
https://www.jaapbrasser.com/tag/code2150859113/
https://www.howtogeek.com/117192/how-to-run-powershell-commands-on-remote-computers/

DISABLING
https://blogs.technet.microsoft.com/bshukla/2011/04/27/how-to-revert-changes-made-by-enable-psremoting/
#>