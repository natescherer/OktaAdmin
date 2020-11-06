$ModuleName = "OktaAPI"
$ModulePath = "$PSScriptRoot\Modules\$ModuleName.psm1"
Get-Module -Name $ModuleName -All | Remove-Module -Force -ErrorAction Ignore
Import-Module -Name $ModulePath -Force -ErrorAction Stop