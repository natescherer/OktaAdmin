function New-OktaGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$group
    )
    Invoke-OktaApi -Uri "v1/groups" -Method POST -Body $group
}