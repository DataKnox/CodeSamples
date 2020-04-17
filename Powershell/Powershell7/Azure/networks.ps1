#Connect-AzAccount

Get-AzSubscription | Where-Object { $_.Name -like "Pay-As-You-Go" } | Select-AzSubscription
Get-AzVirtualNetwork -ResourceGroupName appdev 
#$vnet = Get-AzVirtualNetwork -ResourceGroupName appdev 
#$vnet.SubnetsText | ConvertFrom-Json
Get-AzNetworkSecurityGroup -ResourceGroup appdev