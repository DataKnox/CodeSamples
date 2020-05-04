Get-AdUser -Identity candy.spoon
#Pipeline operations
Get-AdUser -Identity candy.spoon | Disable-AdAccount

#Get all Users in a specific OU
Get-AdUser -Filter 'Name -like "*"' -SearchBase "OU=Users,OU=Accounts,DC=nuggetlab,DC=com"

New-AdUser -Name "Knox Hutchinson" -GivenName "Knox" -Surname "Hutchinson" -SamAccountName "khutchinson" -UserPrincipalName "khutchinson@nuggetlab.com" -AccountPassword (ConvertTo-SecureString -AsPlainText "M!yurtfe777" -Force) -Path "OU=Users,OU=Accounts,DC=nuggetlab,DC=com" -Enabled $True -OtherAttributes @{'mail' = 'khutchinson@nuggetlab.com' }

Get-AdUser khutchinson | Set-ADUser -ChangePasswordAtLogon $True