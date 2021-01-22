function Get-OktaFactors {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors" -Method GET
}