# Get Groups
Get-AdGroup -Filter *
Get-ADGroup -Filter 'GroupCategory -eq "Security" -and GroupScope -ne "DomainLocal"'

Get-AdGroup -Identity "Domain Admins"
# Get Members in a group
Get-AdGroup -Identity "Domain Admins" | Get-AdGroupMember
# New OU
New-ADOrganizationalUnit -Name "Groups" -Path "OU=Users,OU=Accounts,DC=nuggetlab,DC=com"
# New Group
New-ADGroup -Name "App Admins" -SamAccountName appAdmins -GroupCategory security -GroupScope Global -DisplayName "App Admins" -Path "OU=Groups,OU=Users,OU=Accounts,DC=nuggetlab,DC=com"
# Add Members to group d
Add-AdGroupMember -Identity appAdmins -Members candy.spoon