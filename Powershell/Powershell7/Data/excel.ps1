If (!(Get-InstalledModule ImportExcel)) {
    Install-Module ImportExcel -Force
}
else {
    Write-Host "Module exists!"
}

#Import-Csv -Path '/home/knox/Downloads/star-wars/planets.csv' | Export-Excel -Path '/home/knox/Downloads/star-wars/planets.xlsx'
Get-ChildItem -Path '/home/knox/Downloads/star-wars/' | ForEach-Object { if ($_.Extension -eq ".csv") { Export-Excel -path "/home/knox/Downloads/star-wars/$($_.BaseName).xlsx" } }

Import-Excel -path '/home/knox/Downloads/star-wars/characters.xlsx'

$chars = Import-Excel -path '/home/knox/Downloads/star-wars/characters.xlsx' | Select-Object name, species, homeworld
#$chars | Export-Excel -path '/home/knox/Downloads/star-wars/output.xlsx'

$planets = Import-Excel -path '/home/knox/Downloads/star-wars/planets.xlsx'
foreach ($char in $chars) {
    foreach ($planet in $planets) {
        if ($char.homeworld -eq $planet.name) {            
            $char | Add-Member -MemberType NoteProperty -name rotation -Value $planet.rotation_period -Force
        }
    }
}

$chars | Export-Excel -path '/home/knox/Downloads/star-wars/output.xlsx'