$VMName = 'sqlknoxvm'
$ResourceGroupName = 'appdev'
$KeyVaultName = 'knoxsqlkv'
$location = 'southcentralus'

New-AzKeyVault -Name $KeyVaultName `
     -ResourceGroupName $ResourceGroupName `
     -location $location `
     -EnabledForDiskEncryption

$vault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $ResourceGroupName

Set-AzVmDiskEncryptionExtension -ResourceGroupName $ResourceGroupName `
    -VMName $VMName `
    -DiskEncryptionKeyVaultId $vault.ResourceId `
    -DiskEncryptionKeyVaultUrl $vault.VaultUri  `
    -SkipVmBackup `
    -VolumeType All

Get-AzVmDiskEncryptionStatus -ResourceGroupName $ResourceGroupName -VMName $VMName

### USE AN OPTIONAL KEK ###
Add-AzKeyVaultKey -VaultName $KeyVaultName `
    -Name "MyKek" `
    -Destination "HSM" `
    -Size 2048

Set-AzVmDiskEncryptionExtension -ResourceGroupName $ResourceGroupName `
    -VMName $VMName `
    -DiskEncryptionKeyVaultId $vault.ResourceId `
    -DiskEncryptionKeyVaultUrl $vault.VaultUri `
    -KeyEncryptionKeyVaultId $vault.ResourceId `
    -KeyEncryptionKeyVaultUrl $vault.VaultUri `
    -KeyEncryptionKeyUrl $vault.VaultUri + "/keys/MyKek" `
    -SkipVmBackup `
    -VolumeType All
