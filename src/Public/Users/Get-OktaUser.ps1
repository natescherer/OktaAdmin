function Get-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id" -Method GET
}