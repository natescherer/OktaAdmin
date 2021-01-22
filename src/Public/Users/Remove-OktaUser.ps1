function Remove-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    $null = Invoke-OktaApi -Uri "v1/users/$id" -Method DELETE
}