Connect-AzAccount

Get-AzSubscription 

Get-AzSubscription | Where-Object { $_.Name -eq "Knoxs" } | Select-AzSubscription

Get-AzResourceGroup

$rg = Get-AzResourceGroup -Name "knoxsdata"

Get-AzResource -ResourceGroupName $rg.ResourceGroupName

Get-AzResource -ResourceGroupName $(Get-AzResourceGroup -Name "knoxsdata").ResourceGroupName