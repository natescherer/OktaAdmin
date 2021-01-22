function Get-OktaApps {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20,
        [Parameter(Mandatory = $false)]
        [string]$expand,
        [Parameter(Mandatory = $false)]
        [string]$q
    )
    Invoke-OktaApi -Uri "v1/apps?filter=$filter&limit=$limit&expand=$expand&q=$q" -Method GET
}