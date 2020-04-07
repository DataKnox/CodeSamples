$fileUrl = "http://speedtest.tele2.net/1MB.zip"
$output = "./1MB.zip"

Invoke-WebRequest -Uri $fileUrl -OutFile $output