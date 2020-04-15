Connect-AzAccount

Get-AzSubscription | Where-Object { $_.Name -like "Pay-As-You-Go" } | Select-AzSubscription

New-AzVM -Name PoshVm `
    -ResourceGroupName $(Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -like '*Posh' }).ResourceGroupName `
    -Credential (Get-Credential) `
    -Location 'Central US' `
    -Image UbuntuLTS

$vm = Get-AzVm -Name PoshVm -ResourceGroupName MadeByPosh

$vm 

$vm | Get-AzPublicIpAddress 

$vm | Stop-AzVmss

<#
Other useful cmdlets
Start-AzVm
Restart-AzVm
Remove-AzVm

#>