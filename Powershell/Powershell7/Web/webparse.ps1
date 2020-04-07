# Install the module
If (!(Get-InstalledModule PowerHtml)) {
    Install-Module PowerHtml -Force
}
else {
    Write-Host "Module exists!"
}

#perform the web request
$site = Invoke-WebRequest -Uri "https://www.newegg.com"
# understand the properties
$site | Get-Member
#Dump it out to an html
$site.Content | Out-File -FilePath '/home/knox/Desktop/newegg.html'
#load the Html DOM
$html = ConvertFrom-Html -Path '/home/knox/Desktop/newegg.html'

$html.SelectNodes('//li')


#Other useful members
# $site.StatusCode
# $site.InputFields
# $site.Links
# $site.Images
