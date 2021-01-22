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