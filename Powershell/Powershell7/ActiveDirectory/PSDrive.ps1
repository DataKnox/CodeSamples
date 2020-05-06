Get-PsDrive
#Explore the Drive
Get-ChildItem AD:
#Explore Active Directory
Get-ChildItem "DC=nuggetlab,DC=com"

#Explore OUs
Get-ChildItem "OU=Users,OU=Accounts,DC=nuggetlab,DC=com"