$url = "https://dashboard.meraki.com/api/v0/organizations"
$headers = @{
    'Accept'                 = 'application/json' 
    'X-Cisco-Meraki-API-Key' = "6bec40cf957de430a6f1f2baa056b99a4fac9ea0"
}

$orgs = Invoke-RestMethod -Uri $url `
    -Method get `
    -ContentType 'application/json' `
    -Headers $headers 

ForEach ($org in $orgs) {
    If ($org.name -eq 'DevNet Sandbox') {
        $orgId = $org.id
    }
}
$orgId
$net_url = "https://dashboard.meraki.com/api/v0/organizations/$($orgId)/networks"
$networks = Invoke-RestMethod -Uri $net_url `
    -Method get `
    -ContentType 'application/json' `
    -Headers $headers 

ForEach ($network in $networks) {
    #Write-Host $network.name
    If ($network.name -eq 'DNSMB5') {
        $netId = $network.id
    }
}

$devices_url = "https://dashboard.meraki.com/api/v0/networks/$($netId)/devices"
$devices = Invoke-RestMethod -Uri $devices_url `
    -Method get `
    -ContentType 'application/json' `
    -Headers $headers 

$devices | ConvertTo-Json | Write-Output