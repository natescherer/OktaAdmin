function Get-OktaRoles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/roles" -Method GET
}