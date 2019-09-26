Connect-Ucs -Name '10.10.20.113'

Get-UcsBlade

Get-UcsBlade | Select-Object Dn

Get-UcsBlade | Select-Object Dn, TotalMemory, NumOfCpus, Serial