$OktaApiToken = ""
$OktaTenant = ""

# Call Connect-Okta before calling Okta API functions.
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
    } catch {
        $script:OktaApiToken = ""
        $script:OktaTenant = ""
        throw "Connection not successful. Please verify API token and URL."
    }
}

#region Apps - https://developer.okta.com/docs/reference/api/apps

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

function Get-OktaApp {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid
    )
    Invoke-OktaApi -Uri "v1/apps/$appid" -Method GET
}

function Get-OktaApps {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20,
        [Parameter(Mandatory = $false)]
        [string]$expand,
        [Parameter(Mandatory = $false)]
        [string]$q
    )
    Invoke-OktaApi -Uri "v1/apps?filter=$filter&limit=$limit&expand=$expand&q=$q" -Method GET
}

function Add-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$appuser
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users" -Method POST -Body $appuser
}

function Get-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users/$userid" -Method GET
}

function Get-OktaAppUsers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $false)]
        [int]$limit = 50,
        [Parameter(Mandatory = $false)]
        [string]$q
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users?limit=$limit&q=$q" -Method GET
}

function Set-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$appuser
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/users/$userid" -Method POST -Body $appuser
}

function Remove-OktaAppUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $false)]
        [boolean]$sendEmail = $false
    )
    $null = Invoke-OktaApi -Uri "v1/apps/$appid/users/$userid?sendEmail=$sendEmail" -Method DELETE
}

function Add-OktaAppGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$groupid,
        [Parameter(Mandatory = $true)]
        [string]$group
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/groups/$groupid" -Method PUT -Body $group
}

function Get-OktaAppGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/apps/$appid/groups?limit=$limit" -Method GET
}

function Remove-OktaAppGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$appid,
        [Parameter(Mandatory = $true)]
        [string]$groupid
    )
    $null = Invoke-OktaApi -Uri "v1/apps/$appid/groups/$groupid" -Method DELETE
}
#endregion

#region Events - https://developer.okta.com/docs/reference/api/events

function Get-OktaEvents {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$startDate,
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 1000
    )
    Invoke-OktaApi -Uri "v1/events?startDate=$startDate&filter=$filter&limit=$limit" -Method GET
}
#endregion

#region Factors (MFA) - https://developer.okta.com/docs/reference/api/factors

function Get-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factorid
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors/$factorid" -Method GET
}

function Get-OktaFactors {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors" -Method GET
}

function Get-OktaFactorsToEnroll {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors/catalog" -Method GET
}

function Set-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factor,
        [Parameter(Mandatory = $false)]
        [boolean]$activate = $false
    )
    Invoke-OktaApi -Uri "v1/users/$userid/factors?activate=$activate" -Method POST -Body $factor
}

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

function Remove-OktaFactor {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$userid,
        [Parameter(Mandatory = $true)]
        [string]$factorid
    )
    $null = Invoke-OktaApi -Uri "v1/users/$userid/factors/$factorid" -Method DELETE
}
#endregion

#region Groups - https://developer.okta.com/docs/reference/api/groups

function New-OktaGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$group
    )
    Invoke-OktaApi -Uri "v1/groups" -Method POST -Body $group
}

function New-OktaGroupRule {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$groupRule
    )
    Invoke-OktaApi -Uri "v1/groups/rules" -Method POST -Body $groupRule
}

function Get-OktaGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/groups/$id" -Method GET
}

function Get-OktaGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$q,
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200
    )
    Invoke-OktaApi -Uri "v1/groups?q=$q&filter=$filter&limit=$limit" -Method GET
}

function Remove-OktaGroup {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    $null = Invoke-OktaApi -Uri "v1/groups/$id" -Method DELETE
}

function Get-OktaGroupMember {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200
    )
     Invoke-OktaApi -Uri "v1/groups/$id/users?limit=$limit" -Method GET
}

function Get-OktaGroupApps {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/groups/$id/apps?limit=$limit" -Method GET
}

function Get-OktaGroupRules {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [int]$limit = 50
    )
    Invoke-OktaApi -Uri "v1/groups/rules?limit=$limit" -Method
}

function Enable-OktaGroupRule {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$ruleid
    )
    Invoke-OktaApi -Uri "v1/groups/rules/$ruleid/lifecycle/activate" -Method POST
}

function Add-OktaGroupMember {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$groupid,
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    $null = Invoke-OktaApi -Uri "v1/groups/$groupid/users/$userid" -Method PUT
}

function Remove-OktaGroupMember {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$groupid,
        [Parameter(Mandatory = $true)]
        [string]$userid
    )
    $null = Invoke-OktaApi -Uri "v1/groups/$groupid/users/$userid" -Method DELETE
}
#endregion

#region IdPs - https://developer.okta.com/docs/reference/api/idps

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
#endregion

#region Logs - https://developer.okta.com/docs/reference/api/system-log

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
#endregion

#region Roles - https://developer.okta.com/docs/reference/api/roles

function Get-OktaRoles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/roles" -Method GET
}
#endregion

#region Schemas - https://developer.okta.com/docs/reference/api/schemas

function New-OktaSchema {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$schema
    )
    Invoke-OktaApi -Uri "v1/meta/schemas/user/default" -Method POST -Body $schema
}

function Get-OktaSchemas {
    [CmdletBinding()]
    param()
    Invoke-OktaApi -Uri "v1/meta/schemas/user/default" -Method GET
}
#endregion

#region Users - https://developer.okta.com/docs/reference/api/users

function New-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$user,
        [Parameter(Mandatory = $false)]
        [boolean]$activate = $true
    )
    Invoke-OktaApi -Uri "v1/users?activate=$activate" -Method POST -Body $user
}

function Get-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id" -Method GET
}

function Get-OktaUsers {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$q,
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200,
        [Parameter(Mandatory = $false)]
        [string]$search
    )
    Invoke-OktaApi -Uri "v1/users?q=$q&filter=$filter&limit=$limit&search=$search" -Method GET
}

function Set-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $true)]
        [string]$user
    )
    # Only the profile properties specified in the request will be modified when using the POST method.
    Invoke-OktaApi -Uri "v1/users/$id" -Method POST -Body $user
}

function Get-OktaUserAppLinks {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/appLinks" -Method GET
}

function Get-OktaUserGroups {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [int]$limit = 200
    )
    Invoke-OktaApi -Uri "v1/users/$id/groups?limit=$limit" -Method GET
}

function Enable-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [boolean]$sendEmail = $true
    )
    Invoke-OktaApi -Uri "v1/users/$id/lifecycle/activate?sendEmail=$sendEmail" -Method POST
}

function Disable-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    $null = Invoke-OktaApi -Uri "v1/users/$id/lifecycle/deactivate" -Method POST
}

function Set-OktaUserResetPassword {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id,
        [Parameter(Mandatory = $false)]
        [boolean]$sendEmail = $true
    )
    Invoke-OktaApi -Uri "v1/users/$id/lifecycle/reset_password?sendEmail=$sendEmail" -Method POST
}

function Set-OktaUserExpirePassword {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/lifecycle/expire_password" -Method POST
}

function Set-OktaUserUnlocked {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/users/$id/lifecycle/unlock" -Method POST
}

function Remove-OktaUser {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    $null = Invoke-OktaApi -Uri "v1/users/$id" -Method DELETE
}
#endregion

#region Zones - https://developer.okta.com/docs/reference/api/zones

function New-OktaZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$zone
    )
    Invoke-OktaApi -Uri "v1/zones" -Method POST -Body $zone
}

function Get-OktaZone {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$id
    )
    Invoke-OktaApi -Uri "v1/zones/$id" -Method GET
}

function Get-OktaZones {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [string]$filter,
        [Parameter(Mandatory = $false)]
        [int]$limit = 20
    )
    Invoke-OktaApi -Uri "v1/zones?filter=$filter&limit=$limit" -Method GET
}
#endregion

#region Core functions

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
    } elseif ($IsLinux) {
        $OS = "Linux"
    } elseif ($IsMacOS) {
        $OS = "macOS"
    }
    $RestSplat = @{
        Uri = $Uri
        Method = $Method
        Headers = @{
            Authorization = "SSWS $OktaApiToken"
            Accept = "application/json"
            'Content-Type' = "application/json"
        }
        UserAgent = "OktaAdmin/$ModuleVersion PowerShell/$PwshVersion $OS/$OSVersion"
        UseBasicParsing = $true
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
#endregion
