$uri = 'https://ios-xe-mgmt.cisco.com:9443/restconf/data/Cisco-IOS-XE-interfaces-oper:interfaces/interface=GigabitEthernet1'
# $creds = Get-Credential #root D_Vay!_10&
$password = ConvertTo-SecureString 'D_Vay!_10&' -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ('root', $password)
$headers = @{'Accept' = 'application/yang-data+json' }

$response = Invoke-RestMethod -Uri $uri `
    -Method Get `
    -Authentication Basic `
    -Credential $Cred `
    -ContentType 'application/yang-data+json' `
    -Headers $headers `
    -SkipCertificateCheck

$response | ConvertTo-Json | Write-Output

$response.'Cisco-IOS-XE-interfaces-oper:interface'.name

if ($response.'Cisco-IOS-XE-interfaces-oper:interface'.'admin-status' -eq 'if-state-up') {
    Write-Host ($response.'Cisco-IOS-XE-interfaces-oper:interface'.name)'is up'
}
