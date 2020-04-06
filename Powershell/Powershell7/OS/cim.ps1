#Get-cimclass 
Get-cimclass | Where-Object CimClassName -like "*network*"

# Query a class
Get-CimInstance -ClassName "CIM_NetworkAdapter"

#Store a specific object in a variable
$adapter = Get-CimInstance -ClassName "CIM_NetworkAdapter" | Where-Object Name -like "*Realtek*"

$adapter
# Get config info 
Get-CimInstance -ClassName "Win32_NetworkAdapterConfiguration"

#Get OS info
Get-CimInstance -ClassName Win32_OperatingSystem 
#Wait a minute, theres got to be more to our OS than that!
Get-CimInstance -ClassName Win32_OperatingSystem | Get-Member
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object *
# Does it work with NICs too?
Get-CimInstance -ClassName "Win32_NetworkAdapterConfiguration" | Select-Object * 
Get-CimInstance -ClassName "Win32_NetworkAdapterConfiguration" | Select-Object * | Where-Object { $_.DefaultIPGateway -ne $Null }

#Common CIM classes
<#
Win32_Baseboard    
Win32_BIOS
Win32_ComputerSystem
Win32_LogicalDisk  
Win32_OperatingSystem  
Win32_PingStatus
Win32_Printer
Win32_PrinterShare
Win32_PhysicalMemory
Win32_Process
Win32_Processor    
Win32_Share        
#>