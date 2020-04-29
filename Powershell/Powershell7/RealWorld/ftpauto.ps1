# Install the module
If (!(Get-InstalledModule PSFtp)) {
    Install-Module PSFtp -Force
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

# Download an item
Get-FtpItem -Path "/512KB.zip" -Session $sesh

#Check that todays folder exists
If (!(Test-Path -Path "C:\FtpDownloads\512KB-$((Get-Date).toString('yyyy-MM-dd'))")) {
    New-Item -ItemType "directory" -Path "C:\FtpDownloads\512KB-$((Get-Date).toString('yyyy-MM-dd'))"
}

#Move file
Move-Item -Path ".\512KB.zip" -Destination "C:\FtpDownloads\512KB-$((Get-Date).toString('yyyy-MM-dd'))"