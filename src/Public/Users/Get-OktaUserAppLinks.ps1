function Get-OktaUserAppLinks {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/appLinks" -Method GET
}