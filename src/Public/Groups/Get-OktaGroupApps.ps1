function Get-OktaGroupApps {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/groups/$id/apps?limit=$limit" -Method GET
}