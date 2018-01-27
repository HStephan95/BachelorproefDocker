# Aanpassen Windows PowerShell execution policy naar onbeperkt
Set-ExecutionPolicy Unrestricted

# Installeren Chocolatey
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco upgrade chocolatey

# Chocolatey globable uitvoerrechten geven
chocolatey feature enable -n=allowGlobalConfirmation