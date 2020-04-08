$url = 'https://postman-echo.com/post'

$headers = @{
    "Accept"       = "application/json"
    "Content-Type" = "application/json"
}

$payload = @{
    "firstName"   = "Knox"
    "lastName"    = "Hutchinson"
    "Description" = "Knoxs data demo"
} 

$response = Invoke-RestMethod -Uri $url -Headers $headers -Method "Post" -Body ($payload | ConvertTo-Json) -ResponseHeadersVariable r -StatusCodeVariable s 

if ($s -ne 200) {
    Write-Host "failed"
}
else {
    Write-Host "Succeeded"
    $response
    $response.json
}