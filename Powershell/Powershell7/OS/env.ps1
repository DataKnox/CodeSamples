#Show all providers
Get-PSProvider
# Show powershell drives
Get-PSDrive
# Get all environment variables
Get-ChildItem -path Env:
# get current username env variable object
$curr_username = Get-ChildItem -path Env: | Where-Object { $_.Name -eq "USERNAME" }
# write to host
Write-Host "$($curr_username.Name) : $($curr_username.Value)"
# create a new env variable
$env:mypassword = "My-Pw-Value"

$pw = Get-ChildItem -path Env: | Where-Object { $_.Name -eq "mypassword" }

Write-Host "$($pw.Name) : $($pw.Value)"

# Create a psobject credential from env vars
$PWord = ConvertTo-SecureString -String $pw.Value -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $curr_username.Value, $PWord
$Credential