*open-duck-duck-go.ps1*
================

This PowerShell script launches the Web browser with the DuckDuckGo website.

Parameters
----------
```powershell
PS> ./open-duck-duck-go.ps1 [<CommonParameters>]

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./open-duck-duck-go

```

Notes
-----
Author: Markus Fleschutz | License: CC0

Related Links
-------------
https://github.com/fleschutz/PowerShell

Script Content
--------------
```powershell
<#
.SYNOPSIS
	Opens the DuckDuckGo website 
.DESCRIPTION
	This PowerShell script launches the Web browser with the DuckDuckGo website.
.EXAMPLE
	PS> ./open-duck-duck-go
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

& "$PSScriptRoot/open-default-browser.ps1" "https://duckduckgo.com"
exit 0 # success
```

*(generated by convert-ps2md.ps1 using the comment-based help of open-duck-duck-go.ps1 as of 10/19/2023 08:11:41)*