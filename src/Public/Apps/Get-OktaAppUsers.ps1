function Get-OktaAppUsers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $false)]
        [int]$limit = 50,
        [Parameter(Mandatory = $false)]
        [string]$q
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users?limit=$limit&q=$q" -Method GET
}