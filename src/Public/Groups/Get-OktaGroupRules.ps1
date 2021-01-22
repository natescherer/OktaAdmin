function Get-OktaGroupRules {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [int]$limit = 50
    )
    Invoke-OktaApi -Uri "v1/groups/rules?limit=$limit" -Method
}