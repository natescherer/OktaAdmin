function Set-OktaUserExpirePassword {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/lifecycle/expire_password" -Method POST
}