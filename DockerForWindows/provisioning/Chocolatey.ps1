# Controlen en aanpassen Execution-Policy Windows PowerShell naar BYPASS
$CurrentPolicy = get-ExecutionPolicy

Write-Host "#CURRENT POLICY IS $CurrentPolicy#"

if($CurrentPolicy -ne "Bypass")
{
    Write-Host "SETTING CURRENT POLICY TO Bypass"
    Set-ExecutionPolicy Bypass
}


# Installeren Chocolatey
Write-Host "#INSTALLING CHOCOLATEY#"
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco upgrade chocolatey
Write-Host "#CHOCOLATEY INSTALLED#"

# Chocolatey globable uitvoerrechten geven
Write-Host "#SET CHOCOLATEY EXECUTIONRIGHTS#"
chocolatey feature enable -n=allowGlobalConfirmation
Write-Host "#EXECUTIONRIGHTS SET#"

#Ophalen en extracten OpenSSH 
#Write-Host "#GETTING OPENSSH FILES AND EXTRACTING#"
#choco install openssh
#Write-Host "#OPENSSH FILES EXTRACTED#"