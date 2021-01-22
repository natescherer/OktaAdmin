function New-OktaZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$zone
    )
    Invoke-OktaApi -Uri "v1/zones" -Method POST -Body $zone
}