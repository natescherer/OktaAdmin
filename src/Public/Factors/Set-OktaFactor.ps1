function Set-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factor,
        [Parameter(Mandatory = $false)]
        [boolean]$activate = $false
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors?activate=$activate" -Method POST -Body $factor
}