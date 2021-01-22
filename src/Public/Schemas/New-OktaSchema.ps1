function New-OktaSchema {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$schema
    )
    Invoke-OktaApi -Uri "v1/meta/schemas/user/default" -Method POST -Body $schema
}