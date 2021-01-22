function Get-OktaUsers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$q,
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200,
        [Parameter(Mandatory = $false)]
        [string]$search
    )
    Invoke-OktaApi -Uri "v1/users?q=$q&filter=$filter&limit=$limit&search=$search" -Method GET
}