$url = 'https://sandboxsdwan.cisco.com:8443/j_security_check'
$login_body = @{
    j_username = 'devnetuser'
    j_password = 'Cisco123!'
}

$headers = @{'Accept' = 'application/json' }

#$response = `
Invoke-RestMethod -Uri $url `
    -Method post `
    -Body ($login_body) `
    -ContentType 'application/x-www-form-urlencoded' `
    -Headers $headers `
    -SkipCertificateCheck `
    -SessionVariable s
#$response

$uri = 'https://sandboxsdwan.cisco.com:8443/dataservice/device'
$devs = Invoke-RestMethod -Uri $uri `
    -Method Get `
    -ContentType 'application/json' `
    -Headers $headers `
    -SkipCertificateCheck `
    -Websession $s

Write-Host "Output!!!!!!!" 
$devices = $devs.data
ForEach ($device in $devices) {
    write-host $device
}