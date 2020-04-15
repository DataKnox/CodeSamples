Connect-AzAccount

Get-AzSubscription | Where-Object { $_.Name -like "Pay-As-You-Go" } | Select-AzSubscription

Get-AzVirtualNetwork -ResourceGroupName MadeByPosh -Name

Get-AzNetworkSecurityGroup -ResourceGroup MadeByPosh