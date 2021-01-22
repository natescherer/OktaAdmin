function Get-OktaSchemas {
    [CmdletBinding()]
    param()
    Invoke-OktaApi -Uri "v1/meta/schemas/user/default" -Method GET
}