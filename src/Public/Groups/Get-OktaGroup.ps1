function Get-OktaGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/groups/$id" -Method GET
}