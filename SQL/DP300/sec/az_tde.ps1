$ResourceGroupName = "knox-sql-iaas_group"
$location = "southcentralus"
$ServerName = "knoxsqlafter"
$vaultName = 'knoxsqlencr1'
$DBName = "tdeafter"

New-AzKeyVault -VaultName $vaultName `
  -ResourceGroupName $resourceGroupName `
  -Location $location

$server = Set-AzSqlServer -ResourceGroupName $ResourceGroupName `
  -ServerName $ServerName `
  -AssignIdentity

Set-AzKeyVaultAccessPolicy -VaultName $vaultName `
  -ObjectId $server.Identity.PrincipalId `
  -PermissionsToKeys get, wrapKey, unwrapKey


Update-AzKeyVaultNetworkRuleSet -VaultName $vaultname -Bypass AzureServices


Update-AzKeyVaultNetworkRuleSet -VaultName $vaultname -IpAddressRange "104.59.68.226/32"


Update-AzKeyVaultNetworkRuleSet -VaultName $vaultname -DefaultAction Deny

$key = Add-AzKeyVaultKey -VaultName $vaultname `
  -Name MyTDEKey `
  -Destination Software `
  -Size 2048


Add-AzSqlServerKeyVaultKey -ResourceGroupName $ResourceGroupName `
  -ServerName $ServerName `
  -KeyId $key.Id


Set-AzSqlServerTransparentDataEncryptionProtector -ResourceGroupName $ResourceGroupName `
  -ServerName $ServerName `
  -Type AzureKeyVault `
  -KeyId $key.Id


Get-AzSqlServerTransparentDataEncryptionProtector -ResourceGroupName $ResourceGroupName -ServerName $ServerName

Set-AzSqlDatabaseTransparentDataEncryption -ResourceGroupName $ResourceGroupName `
  -ServerName $ServerName `
  -DatabaseName $DBName `
  -State "Enabled"