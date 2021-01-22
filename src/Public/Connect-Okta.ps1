function Connect-Okta {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ApiToken,
        [Parameter(Mandatory = $true)]
        [string]$Tenant
    )
    $script:OktaApiToken = $ApiToken
    $script:OktaTenant = $Tenant

    try {
        Get-OktaUsers -q "OktaAdminPowerShellConnectionTest@test.com" | Out-Null
    }
    catch {
        $script:OktaApiToken = ""
        $script:OktaTenant = ""
        throw "Connection not successful. Please verify API token and URL."
    }
}