function Get-OktaZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/zones/$id" -Method GET
}