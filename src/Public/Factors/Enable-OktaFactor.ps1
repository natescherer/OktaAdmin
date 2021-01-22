function Enable-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factorid,
        [Parameter(Mandatory = $true)]
        [string]$body
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors/$factorid/lifecycle/activate" -Method POST -Body $body
}