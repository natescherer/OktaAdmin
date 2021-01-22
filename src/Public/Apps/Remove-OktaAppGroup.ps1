function Remove-OktaAppGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$groupid
    )
    $null = Invoke-OktaApi -Uri "v1/apps/$appid/groups/$groupid" -Method DELETE
}