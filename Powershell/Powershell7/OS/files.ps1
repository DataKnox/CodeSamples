Set-Location '/home/knox/Documents/CodeSamples/Powershell/Powershell7'

# show child files
Get-ChildItem -path ./

#recursive show child files
Get-ChildItem -path ./ -Recurse

#explicit path
Get-ChildItem -path '/home/knox/Documents' -Recurse

#filter by extension and store in a variable
$files = Get-ChildItem -path '/home/knox/Documents' -Recurse -Filter '*.ps1'

#check properties
$files | Get-Member

# copying files to a new folder
If (!(Test-Path -Path '/home/knox/Desktop/power-demo')) {
    New-Item -ItemType "directory" -Path '/home/knox/Desktop/power-demo' 
}

ForEach ($file in $files) {
    Copy-Item -path $file.FullName -Destination '/home/knox/Desktop/power-demo'
}

#Create 2 new files in the targer folder
New-Item -ItemType "file" -Path '/home/knox/Desktop/power-demo/demo.txt', '/home/knox/Desktop/power-demo/demo.yml'

# delete only ps1 files
Get-ChildItem -Path '/home/knox/Desktop/power-demo' -Filter '*.ps1' | Remove-Item

#Think about automation. What if we want to copy files every day?
If (!(Test-Path -Path "/home/knox/Desktop/power-demo-$((Get-Date).toString('yyyy-MM-dd'))")) {
    New-Item -ItemType "directory" -Path "/home/knox/Desktop/power-demo-$((Get-Date).toString('yyyy-MM-dd'))"
}
ForEach ($file in $files) {
    Copy-Item -path $file.FullName -Destination "/home/knox/Desktop/power-demo-$((Get-Date).toString('yyyy-MM-dd'))"
}