function Disable-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    $null = Invoke-OktaApi -Uri "v1/users/$id/lifecycle/deactivate" -Method POST
}