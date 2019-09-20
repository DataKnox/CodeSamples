$url = "https://dashboard.meraki.com/api/v0/organizations"
$headers = @{
    'Accept'                 = 'application/json' 
    'X-Cisco-Meraki-API-Key' = "6bec40cf957de430a6f1f2baa056b99a4fac9ea0"
}

$response = Invoke-RestMethod -Uri $url `
    -Method get `
    -ContentType 'application/json' `
    -Headers $headers `

$response | ConvertTo-Json | Write-Output