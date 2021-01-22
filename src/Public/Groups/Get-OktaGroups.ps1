function Get-OktaGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$q,
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200
    )
    Invoke-OktaApi -Uri "v1/groups?q=$q&filter=$filter&limit=$limit" -Method GET
}