Import-Module VMware.VimAutomation.Core
Get-Module | FT

#Remove-Module VMware.VimAutomation.Core

Get-InstalledModule | Where-Object { $_.Name -like "VMWare*" } | Uninstall-Module

Get-Module -ListAvailable | FT