function Get-OktaZones {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/zones?filter=$filter&limit=$limit" -Method GET
}