$url = "https://pokeapi.co/api/v2/pokemon/"

$response = Invoke-RestMethod -Uri $url -Method get -ResponseHeadersVariable r -StatusCodeVariable s




if ($s -eq 200) {
    foreach ($re in $response.results) {
        $pokemon = Invoke-RestMethod -uri $re.url
        
        $queryPoke = @"
INSERT INTO dbo.Pokemon (Id,Name,Height,Weight)
VALUES ($($pokemon.Id),'$($pokemon.Name)',$($pokemon.Height),$($pokemon.Weight),$(If($pokemon.is_default -eq $True){1}else{0}))
"@
        $queryPoke

        Invoke-Sqlcmd -ServerInstance "192.168.1.102" -Database "PokeDB" -Query $queryPoke 

        foreach ($move in $pokemon.moves) {
            $mv = Invoke-RestMethod -Uri $move.move.url
            $queryMoves = @"
INSERT INTO dbo.Moves (Id,PokemonId,Name,Type,PP)
VALUES ('$mv.Id',$pokemon.Id','$mv.name','$mv.type.name','$mv.pp')
"@
            Invoke-Sqlcmd -ServerInstance "192.168.1.102" -Database "PokeDB" -Query $queryMoves
        }
    }

    while ($null -ne $response.next) {
        $response = Invoke-RestMethod -uri $response.next

        foreach ($re in $response.results) {
            $pokemon = Invoke-RestMethod -uri $re.url
            $queryPoke = @"
        INSERT INTO dbo.Pokemon (Id,Name,Height,Weight)
        VALUES ('$pokemon.Id','$pokemon.Name','$pokemon.Height','$pokemon.Weight')
"@

            Invoke-Sqlcmd -ServerInstance "192.168.1.102" -Database "PokeDB" -Query $queryPoke 
            
            foreach ($move in $pokemon.moves) {
                $mv = Invoke-RestMethod -Uri $move.move.url
                $queryMoves = @"
                INSERT INTO dbo.Moves (Id,PokemonId,Name,Type,PP)
                VALUES ('$mv.Id',$pokemon.Id','$mv.name','$mv.type.name','$mv.pp')
"@
                Invoke-Sqlcmd -ServerInstance "192.168.1.102" -Database "PokeDB" -Query $queryMoves
            }
            
            
        }
    }
}
else {
    $r
}