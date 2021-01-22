function Remove-OktaGroupMember {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$groupid,
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    $null = Invoke-OktaApi -Uri "v1/groups/$groupid/users/$userid" -Method DELETE
}