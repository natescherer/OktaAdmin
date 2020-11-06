$global:ModuleName = Split-Path -Path ($PSCommandPath -replace '\.Tests\.ps1$','') -Leaf
$global:ModulePath = "$(Split-Path -Path $PSScriptRoot -Parent)\src\$ModuleName.psm1"
$global:ModuleManifestPath = "$(Split-Path -Path $PSScriptRoot -Parent)\src\$ModuleName.psd1"
Get-Module -Name $ModuleName -All | Remove-Module -Force -ErrorAction Ignore
Import-Module -Name $ModulePath -Force -ErrorAction Stop

InModuleScope $ModuleName {
    Describe 'Module Manifest Tests' {
        It 'Passes Test-ModuleManifest' {
            Test-ModuleManifest -Path $ModuleManifestPath | Should -Not -BeNullOrEmpty
            $? | Should -Be $true
        }
    }
}
