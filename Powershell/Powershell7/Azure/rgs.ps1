Connect-AzAccount

Get-AzSubscription | Where-Object { $_.Name -like "Pay-As-You-Go" } | Select-AzSubscription

Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -like '*Posh*' }

New-AzResourceGroup -Name MadeByPosh -Location 'Central US'

Get-AzResourceGroup | FT

Get-AzResource -ResourceGroupName 'MadeByPosh'