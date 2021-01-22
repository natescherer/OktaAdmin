function Set-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$appuser
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users/$userid" -Method POST -Body $appuser
}