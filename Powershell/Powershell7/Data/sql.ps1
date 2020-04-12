If (!(Get-InstalledModule SqlServer)) {
    Install-Module SqlServer -Force
}
else {
    Write-Host "Module exists!"
}

$query = @"
SELECT 
    *
FROM
    dbo.people p
JOIN
    dbo.planets pp 
    ON p.HomePlanetID = pp.PlanetID
"@

Invoke-Sqlcmd -ServerInstance "localhost,1402" -Database "SWDB" -Query "SELECT * FROM dbo.People" -Username "SA" -Password "MyStrongPw!23"

#Invoke-Sqlcmd -ServerInstance "localhost,1402" -Database "SWDB" -Query "SELECT * FROM dbo.People" -Username "SA" -Password "MyStrongPw!23" | Export-Excel -Path '/home/knox/Desktop/query.xlsx'

