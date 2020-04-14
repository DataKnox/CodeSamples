Get-PSRepository

#Explore the module on the repo
Find-Module -Name VMWare.PowerCLI
#install
If (!(Get-InstalledModule VMWare.PowerCLI)) {
    Install-Module VMWare.PowerCLI -Force
}

#note that the installed module is still not in the session
Get-Module -ListAvailable | FT

#Import the module into the session
Import-Module VMWare.VimAutomation.Core
# Get all commands for PowerCLI
Get-Command -Module VMware.VimAutomation.Core

Get-Help New-VM 