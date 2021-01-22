function Remove-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $false)]
        [boolean]$sendEmail = $false
    )
    $null = Invoke-OktaApi -Uri "v1/apps/$appid/users/$userid?sendEmail=$sendEmail" -Method DELETE
}