#Block your process
$i = 1
while ($True) {
    $i++
    $i
    Start-Sleep 5
}
# Start a job
Start-Job -ScriptBlock {
    $i = 1
    while ($True) {
        $i++
        $i
        Start-Sleep 5
    }
}
# Details
Get-Job Job1
Receive-Job Job1
Stop-Job Job1
#Job parameter
Invoke-Command dc-nug { Get-Service } -AsJob