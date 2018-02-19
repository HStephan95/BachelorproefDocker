# Controlen en aanpassen Execution-Policy Windows PowerShell naar BYPASS
$CurrentPolicy = get-ExecutionPolicy

Write-Host "#CURRENT POLICY IS $CurrentPolicy #"

if($CurrentPolicy -ne "Bypass")
{
    Write-Host "SETTING CURRENT POLICY TO Bypass"
    Set-ExecutionPolicy Bypass
}

# Installeren Docker
Write-Host "#INSTALLING DOCKER#"
Install-Module DockerProvider -Force
Install-Package Docker -ProviderName DockerProvider -Force
Write-Host "#DOCKER INSTALLED#"

Write-Host "#GOING to Reboot#"