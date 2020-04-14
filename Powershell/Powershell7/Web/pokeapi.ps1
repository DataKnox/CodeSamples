$url = "https://pokeapi.co/api/v2/pokemon/"

$response = Invoke-RestMethod -Uri $url -Method get -ResponseHeadersVariable r -StatusCodeVariable s

if ($s -eq 200) {
    $response.results
    while ($response.next -ne $null) {
        $response = Invoke-RestMethod -uri $response.next
        $response.results
    }
}
else {
    $r
}