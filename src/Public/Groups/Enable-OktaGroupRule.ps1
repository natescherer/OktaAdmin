function Enable-OktaGroupRule {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ruleid
    )
    Invoke-OktaApi -Uri "v1/groups/rules/$ruleid/lifecycle/activate" -Method POST
}