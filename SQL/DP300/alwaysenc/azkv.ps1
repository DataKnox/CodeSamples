$subscriptionName = 'Pay-As-You-Go'
$userPrincipalName = 'knox@knoxsdata.com'
$applicationId = '<applicationId from AAD application>'
$resourceGroupName = 'appdev' # use the same resource group name when creating your SQL Database below
$location = 'southcentralus'
$vaultName = 'knoxsqlencr'

Connect-AzAccount
$subscriptionId = (Get-AzSubscription -SubscriptionName $subscriptionName).Id
Set-AzContext -SubscriptionId $subscriptionId

New-AzResourceGroup -Name $resourceGroupName -Location $location
New-AzKeyVault -VaultName $vaultName -ResourceGroupName $resourceGroupName -Location $location

Set-AzKeyVaultAccessPolicy -VaultName $vaultName -ResourceGroupName $resourceGroupName -PermissionsToKeys create,get,wrapKey,unwrapKey,sign,verify,list -UserPrincipalName $userPrincipalName
Set-AzKeyVaultAccessPolicy  -VaultName $vaultName  -ResourceGroupName $resourceGroupName -ServicePrincipalName $applicationId -PermissionsToKeys get,wrapKey,unwrapKey,sign,verify,list