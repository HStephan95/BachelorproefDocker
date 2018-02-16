# Aanpassen Windows PowerShell execution policy naar onbeperkt

$CurrentPolicy = get-ExecutionPolicy

Write-Host "CURRENT POLICY IS $CurrentPolicy"

if($CurrentPolicy -ne "Bypass")
{
    Write-Host "SETTING CURRENT POLICY TO Bypass"
    Set-ExecutionPolicy Bypass
}


# Installeren Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey

# Chocolatey globable uitvoerrechten geven
chocolatey feature enable -n=allowGlobalConfirmation

#installeren OpenSSH 
Write-Host "getting OpenSSHfiles and extract"

choco install openssh


