<#
    .DESCRIPTION
        An Azure Az PowerShell Script that will create or remove a ReadOnly lock on the specified resource group.

    .NOTES
        AUTHOR: Mike Oryszak | Git:  @moryszak | Twitter:  @next_connect
        LASTEDIT: April 28, 2019
#>
$resourceGroup = 'myresourcegroup'
$action = 'enable'
$lockId = ''

# $action = 'disable' #

if ($action -eq 'enable'){
    New-AzResourceLock -LockName 'Budgetlock' -LockLevel ReadOnly -ResourceGroupName $resourceGroup -Force
}
else {
    $lockId = (Get-AzResourceLock -ResourceGroupName $resourceGroup -LockName 'BudgetLock').LockId
    Remove-AzResourceLock -LockId $lockId -Force
}

