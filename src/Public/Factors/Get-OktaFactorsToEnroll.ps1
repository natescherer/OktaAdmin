function Get-OktaFactorsToEnroll {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors/catalog" -Method GET
}