function Get-OktaApp {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid
    )
    Invoke-OktaApi -Uri "v1/apps/$appid" -Method GET
}