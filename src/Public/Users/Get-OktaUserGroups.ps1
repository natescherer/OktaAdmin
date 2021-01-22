function Get-OktaUserGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200
    )
    Invoke-OktaApi -Uri "v1/users/$id/groups?limit=$limit" -Method GET
}