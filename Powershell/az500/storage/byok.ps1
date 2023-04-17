$rgName = "appdev"
$location = "southcentralus"
$kvName = "knoxstgkv"
$keyName = "stg-key"
$accountName = "knoxstgscus"

$keyVault = New-AzKeyVault -Name $kvName `
    -ResourceGroupName $rgName `
    -Location $location `
    -EnablePurgeProtection `
    -EnableRbacAuthorization

New-AzUserAssignedIdentity -ResourceGroupName $rgName -Name "knoxstgidentity" --location $location

New-AzRoleAssignment -SignInName "knox@knoxsdata.com" `
    -RoleDefinitionName "Key Vault Crypto Officer" `
    -Scope $keyVault.ResourceId



$key = Add-AzKeyVaultKey -VaultName $keyVault.VaultName `
    -Name $keyName `
    -Destination 'Software'


$userIdentity = Get-AzUserAssignedIdentity -Name "knoxstgidentity" `
    -ResourceGroupName $rgName

$principalId = $userIdentity.PrincipalId

New-AzRoleAssignment -ObjectId $principalId `
    -RoleDefinitionName "Key Vault Crypto Service Encryption User" `
    -Scope $keyVault.ResourceId



New-AzStorageAccount -ResourceGroupName $rgName `
    -Name $accountName `
    -Kind StorageV2 `
    -SkuName Standard_LRS `
    -Location $location `
    -IdentityType SystemAssignedUserAssigned `
    -UserAssignedIdentityId $userIdentity.Id `
    -KeyVaultUri $keyVault.VaultUri `
    -KeyName $key.Name `
    -KeyVaultUserAssignedIdentityId $userIdentity.Id