function Add-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$appuser
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users" -Method POST -Body $appuser
}