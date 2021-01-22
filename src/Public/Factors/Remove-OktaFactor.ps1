function Remove-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factorid
    )
    $null = Invoke-OktaApi -Uri "v1/users/$userid/factors/$factorid" -Method DELETE
}