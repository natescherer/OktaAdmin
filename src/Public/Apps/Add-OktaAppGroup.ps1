function Add-OktaAppGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$groupid,
        [Parameter(Mandatory = $true)]
        [string]$group
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/groups/$groupid" -Method PUT -Body $group
}