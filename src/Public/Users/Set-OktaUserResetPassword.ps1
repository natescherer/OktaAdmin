function Set-OktaUserResetPassword {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [boolean]$sendEmail = $true
    )
    Invoke-OktaApi -Uri "v1/users/$id/lifecycle/reset_password?sendEmail=$sendEmail" -Method POST
}