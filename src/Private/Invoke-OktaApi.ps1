function Invoke-OktaApi {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$Uri,
        [Parameter(Mandatory = $true)]
        [string]$Method,
        [Parameter(Mandatory = $false)]
        [string]$Body
    )
    $Output = @()

    if (!$OktaApiToken -or !$OktaTenant) {
        throw "Okta connection information not found. Please run Connect-Okta before running this cmdlet."
    }

    if ($Uri -notMatch '^http') { $Uri = "https://$OktaTenant/api/$Uri" }

    $ModuleVersion = (Get-Module OktaAdmin).Version.ToString()
    $PwshVersion = $PSVersionTable.PSVersion
    $OSVersion = [Environment]::OSVersion.Version.ToString()
    if (($PSVersionTable.PSVersion.Major -lt 6) -or $IsWindows) {
        $OS = "Windows"
    }
    elseif ($IsLinux) {
        $OS = "Linux"
    }
    elseif ($IsMacOS) {
        $OS = "macOS"
    }
    $RestSplat = @{
        Uri                     = $Uri
        Method                  = $Method
        Headers                 = @{
            Authorization  = "SSWS $OktaApiToken"
            Accept         = "application/json"
            'Content-Type' = "application/json"
        }
        UserAgent               = "OktaAdmin/$ModuleVersion PowerShell/$PwshVersion $OS/$OSVersion"
        UseBasicParsing         = $true
        ResponseHeadersVariable = "ResponseHeaders"
    }
    if ($Body) {
        $RestSplat += @{ $Body = (ConvertTo-Json -InputObject $Body -Compress -Depth 100) }
    }

    $SecurityProtocolBackup = [Net.ServicePointManager]::SecurityProtocol
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    do {
        $Response = Invoke-RestMethod @RestSplat

        $Output += $Response

        $ApiLimit = $ResponseHeaders.'X-Rate-Limit-Limit'
        $ApiLimitRemaining = $ResponseHeaders.'X-Rate-Limit-Remaining'
        $ApiLimitResetTime = $ResponseHeaders.'X-Rate-Limit-Reset'

        $Links = @{}
        if ($ResponseHeaders.Link) {
            foreach ($Header in $ResponseHeaders.Link.split(",")) {
                if ($Header -match '<(.*)>; rel="(.*)"') {
                    $Links[$Matches[2]] = $Matches[1]
                }
            }
        }
        if ($Links.next) {
            $RestSplat.Uri = $Links.next
        }
    } while ($Links.next)
    [Net.ServicePointManager]::SecurityProtocol = $SecurityProtocolBackup

    $Output
}