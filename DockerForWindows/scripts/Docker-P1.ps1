

# Aanpassen Windows PowerShell execution policy naar onbeperkt
$CurrentPolicy = get-ExecutionPolicy

Write-Host "CURRENT POLICY IS $CurrentPolicy"

if($CurrentPolicy -ne "Bypass")
{
    Write-Host "SETTING CURRENT POLICY TO Bypass"
    Set-ExecutionPolicy Bypass
}

Write-Host "#GOING to INSTALL DOCKER#"
# Installeren Docker
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force
# Start Docker
<#
Install-Module -Name DockerMsftProvider -Force
Install-Package -Name docker -ProviderName DockerMsftProvider -Force

Restart-Computer -Force

#>
Write-Host "#GOING to Reboot#"


# Start Docker

