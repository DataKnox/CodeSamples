Get-Location

$loc = Get-Location

$loc

#change location
$loc = Set-Location -path '/home/knox/Documents'

$loc

#alias
sl -path '/home/knox/Downloads'

Get-Location

# Push current location to stack for tracking, then switch to home/knox
Push-Location -path '/home/knox/'

#verify we are in home/knox
Get-Location

#push current location to stack, then change to documents
Push-Location -path '/home/knox/Documents'

# verify
Get-Location

# jump back to last location
Pop-Location

Get-Location


