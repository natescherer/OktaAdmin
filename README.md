# OktaAdmin

**NOTE: This module was never completed and I no longer work with Okta in my day-to-day. If anyone would like to take this over, please open an Issue.**

A PowerShell module to simplify tasks for Okta admins. Designed to be similar to Active Directory/Azure PowerShell cmdlets.

This module is unofficial and is neither developed nor supported by Okta.

## Getting Started

OktaAdmin is compatible with Windows PowerShell 5.1+ and PowerShell 6.0+ on Windows/Linux/macOS.

### Prerequisites

No prerequisites are required beyond having PowerShell installed.

### Installing
FILL ME IN
<!-- OktaAdmin is listed in the PowerShell Gallery [here](https://www.powershellgallery.com/packages/OktaAdmin), which means you can install on any internet-connected computer running PowerShell 5+ by running this command:

```PowerShell
Install-Module -Name OktaAdmin
```

If you'd prefer to install manually, follow these instructions:

1. Download the latest release from [releases](../../releases).
1. Extract it, then run the following to install

    ```PowerShell
    Install-Module -Path EXTRACTION-PATH-HERE\OktaAdmin
    ``` -->

## Usage

### Examples

<!-- #### Send-HtmlMailMessage

```PowerShell
$EmailSplat = @{
    To = "admin@contoso.com"
    Cc = "admin2@contoso.com"
    From = "poshemail@contoso.com"
    Subject = "Alert"
    Heading = "Alert"
    Footer = "Sent at $((Get-Date).ToUniversalTime() | Get-Date -format s) UTC"
    LastLine = ""
    Body = "This is an alert message."
    SmtpServer = "smtp.office365.com" 
    UseSsl = $true
    Port = 587
    Credential = $CredentialObject
}
Send-HtmlMailMessage @EmailSplat
``` -->

### Documentation

For detailed documentation, [click here on GitHub](docs), see the docs folder in a release, or run Get-Help for the individual function in PowerShell.

## Questions/Comments

If you have questions, comments, etc, please enter a GitHub Issue tag.

## Contributing/Bug Reporting

Contributions and bug reports are gladly accepted! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Building

FILL ME IN

## Authors

**Nate Scherer** - *Initial work* - [natescherer](https://github.com/natescherer)

## License

This project is licensed under The MIT License - see [LICENSE](LICENSE) for details.

## Acknowledgements

[gabrielsroka](https://github.com/gabrielsroka/OktaAPI.psm1) - OktaAdmin began its life as a fork of gabrielsroka's OktaAPI, and the author wishes to give acknowledgement and thanks.

[mbegan](https://github.com/mbegan/Okta-PSModule) - As OktaAPI extended from mbegan's Okta-PSModule, the author would also like to give acknowledgement and thanks.
