function New-OktaGroupRule {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$groupRule
    )
    Invoke-OktaApi -Uri "v1/groups/rules" -Method POST -Body $groupRule
}