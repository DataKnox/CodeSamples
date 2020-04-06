Get-Content -Path './sw.json'

$json = Get-Content -Path './sw.json'

$json = $json | ConvertFrom-Json
$json.movies