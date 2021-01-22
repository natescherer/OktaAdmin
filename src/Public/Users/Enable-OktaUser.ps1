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