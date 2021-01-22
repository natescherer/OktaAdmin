function Remove-OktaGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    $null = Invoke-OktaApi -Uri "v1/groups/$id" -Method DELETE
}