$baseUrl = "https://swapi.co/api/"


# Set headers
$headers = @{
    "Accept" = "application/json"
}

#See all available endpoints
$response = Invoke-RestMethod -Uri $baseUrl -Method "GET" -Headers $headers -ContentType "application/json"

#Set People endpoint
$people = "people"

$response = Invoke-RestMethod -Uri $baseUrl$people

#$response

#$response.results
# Loop over each result and update Homeworld with another API call
foreach ($person in $response.results) {
    $worldUrl = $person.homeworld
    $planetResponse = Invoke-RestMethod -Uri $worldUrl
    $person.homeworld = $planetResponse
}

$response.results