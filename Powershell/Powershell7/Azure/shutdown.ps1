#Connect-AzAccount

Get-AzSubscription | Where-Object { $_.Name -like "Pay-as-you-Go" } | Select-AzSubscription
Write-Host "$(Get-Date): Printing list of RGs"
Get-AzResourceGroup 

$rg = Read-Host -Prompt "Which Resource Group would you like to disable?"

$rgContext = Get-AzResourceGroup -Name $rg

Write-Host "$(Get-Date): Getting VMs"

$vms = Get-AzVm -Status

foreach ($vm in $vms) {
    if ($vm.PowerState -like "*running*") {
        Write-Host "$(Get-Date): $($vm.Name) is running. Stopping"
        $vm | Stop-AzVm -Force -NoWait
        Write-Host "$(Get-Date): $($vm.Name) is stopping"
    }
}