## INSTALL iSCSI SERVER ROLE ON FILE SHARE FIRST!!
Invoke-Command FILE-NUG { Install-WindowsFeature File-Services }

Invoke-Command SQL-CL1, SQL-CL2 { Get-Service *iscsi* | Set-Service -StartupType Automatic -PassThru | Start-Service }

Invoke-Command SQL-CL1, SQL-CL2 { Get-InitiatorPort }

Invoke-Command SQL-CL1, SQL-CL2 { New-IscsiTargetPortal -TargetPortalAddress 10.10.10.14 }

### TARGET
Invoke-Command FILE-NUG { New-IscsiVirtualDisk -Path I:\CL-Data.vhdx -SizeBytes 30GB }
Invoke-Command FILE-NUG { New-IscsiVirtualDisk -Path I:\CL-Logs.vhdx -SizeBytes 10GB }

Invoke-Command FILE-NUG { New-IscsiServerTarget -TargetName CL-Target -InitiatorIds "iqn1", "iqn2" }

Invoke-Command FILE-NUG { Add-IscsiVirtualDiskTargetMapping -TargetName CL-Target -Path I:\CL-Data.vhdx }
Invoke-Command FILE-NUG { Add-IscsiVirtualDiskTargetMapping -TargetName CL-Target -Path I:\CL-Logs.vhdx }

### INITIATOR
Invoke-Command SQL-CL1, SQL-CL2 { Get-IscsiTargetPortal | Update-IscsiTargetPortal }

Invoke-Command SQL-CL1, SQL-CL2 { Get-IscsiTarget | Connect-IscsiTarget }

Invoke-Command SQL-CL1, SQL-CL2 { Get-IscsiSession | Register-IscsiSession }

## BRING DRIVES ONLINE NOW VIA SERVER MANAGER AND CREATE A VOLUME


Invoke-Command SQL-CL1, SQL-CL2 `
{ Install-WindowsFeature Failover-Clustering -IncludeManagementTools -IncludeAllSubFeature }
Invoke-Command SQL-CL1, SQL-CL2 { Restart-Computer }

New-Cluster SQL-CL -node SQL-CL1, SQL-CL2 -StaticAddress 10.10.10.100  
Set-ClusterQuorum -cluster SQL-CL -CloudWitness `
    -AccountName <name> `
    -AccessKey <key>