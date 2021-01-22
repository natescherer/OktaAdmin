function Get-OktaIdps {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$q,
        [Parameter(Mandatory = $false)]
        [string]$type,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/idps?q=$q&type=$type&limit=$limit" -Method GET
}