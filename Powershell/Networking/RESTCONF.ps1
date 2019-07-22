$uri = 'https://ios-xe-mgmt.cisco.com:9443/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces/interface=GigabitEthernet1'
$creds = Get-Credential #root D_Vay!_10&
$headers = @{'Accept' = 'application/yang-data+json' }

$response = Invoke-RestMethod -Uri $uri `
    -Method Get `
    -Authentication Basic `
    -Credential $creds `
    -ContentType 'application/yang-data+json' `
    -Headers $headers `
    -SkipCertificateCheck

$response | ConvertTo-Json | Write-Output

$response.'Cisco-IOS-XE-interfaces-oper:interface'.name

if ($response.'Cisco-IOS-XE-interfaces-oper:interface'.'admin-status' -eq 'if-state-up') {
    Write-Host ($response.'Cisco-IOS-XE-interfaces-oper:interface'.name)'is up'
}
