# Install the module
If (!(Get-InstalledModule SqlServer)) {
    Install-Module SqlServer -Force
}
else {
    Write-Host "Module exists!"
}

#set up login creds
$user = "anonymous"
$PWord = ConvertTo-SecureString -String "anonymous" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, $PWord

#establish the connection and hold a session object
Set-FtpConnection -Server "ftp://speedtest.tele2.net/" -Session MySesh -Credentials $Credential
$sesh = Get-FtpConnection -Session MySesh

# get all items
Get-FtpChildItem -Session $sesh -Path / 
# Download an item
Get-FtpItem -Path "/512KB.zip" -Session $sesh
# Send an item
Add-FtpItem -Path "/upload" -LocalPath '/home/knox/Documents/starwars.xlsx'