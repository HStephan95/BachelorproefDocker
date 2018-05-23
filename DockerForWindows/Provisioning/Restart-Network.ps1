Write-Host "#RESTARTING CONTAINER NETWORK#"
# Herstarten container netwerk

Get-ContainerNetwork | Remove-ContainerNetwork
Restart-Service Docker
Get-Service Docker