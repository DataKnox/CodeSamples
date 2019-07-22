$uri = 'https://IP OR FQDN:8443/api/login'
$headers = @{'Accept' = 'application/json' }
$params = @{
    'username' = 'USER';
    'password' = 'PASSWORD';
}
$body = $params | ConvertTo-Json

$response = Invoke-RestMethod -Uri $uri `
    -Body $body `
    -Method Post `
    -ContentType 'application/json' `
    -Headers $headers `
    -SkipCertificateCheck `
    -SessionVariable s
    

#$response | ConvertTo-Json | Write-Output

$uri = 'https://IP OR FQDN:8443/api/self/sites'
$sites = Invoke-RestMethod -Uri $uri `
    -Method Get `
    -ContentType 'application/json' `
    -Headers $headers `
    -SkipCertificateCheck `
    -Websession $s

#$sites | ConvertTo-Json | Write-Output

$siteData = $sites.data
$name = $siteData | Where-Object { $_.desc -eq 'Knox-Home' } | Select-Object name

$uri = "https://IP OR FQDN:8443/api/s/$($name.name)/stat/device"
$devices = Invoke-RestMethod -Uri $uri `
    -Method Get `
    -ContentType 'application/json' `
    -Headers $headers `
    -SkipCertificateCheck `
    -Websession $s
    
$devices | ConvertTo-Json | Write-Output