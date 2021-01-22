function New-OktaApp {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$app,
        [Parameter(Mandatory = $false)]
        [boolean]$activate = $true
    )
    Invoke-OktaApi -Uri "v1/apps?activate=$activate" -Method POST -Body $app
}