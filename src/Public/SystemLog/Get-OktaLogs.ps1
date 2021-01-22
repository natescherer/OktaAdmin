function Get-OktaLogs {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$since,
        [Parameter(Mandatory = $false)]
        [string]$until,
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [string]$q,
        [Parameter(Mandatory = $false)]
        [string]$sortOrder = "ASCENDING",
        [Parameter(Mandatory = $false)]
        [int]$limit = 100
    )
    Invoke-OktaApi -Uri "v1/logs?since=$since&until=$until&filter=$filter&q=$q&sortOrder=$sortOrder&limit=$limit" -Method GET
}