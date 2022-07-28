# POWER BI POWERSHELL DOCS https://docs.microsoft.com/en-us/powershell/power-bi/overview?view=powerbi-ps
#=
Install-Module -Name MicrosoftPowerBIMgmt -Scope CurrentUser

Login-PowerBI


# Current user's workspaces
Get-PowerBIWorkspace
Get-PowerBIWorkspace -Name Dev

# All workspaces, admin
Get-PowerBIWorkspace -Scope Organization

Get-PowerBIReport
Get-PowerBIDataset