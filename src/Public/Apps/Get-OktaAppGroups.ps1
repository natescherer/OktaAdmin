function Get-OktaAppGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/groups?limit=$limit" -Method GET
}