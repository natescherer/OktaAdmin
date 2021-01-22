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