function Get-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users/$userid" -Method GET
}