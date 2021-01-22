function Get-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factorid
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors/$factorid" -Method GET
}