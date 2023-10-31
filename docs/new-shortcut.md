*new-shortcut.ps1*
================

This PowerShell script creates a new shortcut file.

Parameters
----------
```powershell
PS> ./new-shortcut.ps1 [[-shortcut] <String>] [[-target] <String>] [[-description] <String>] [<CommonParameters>]

-shortcut <String>
    Specifies the shortcut filename
    
    Required?                    false
    Position?                    1
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-target <String>
    Specifies the path to the target
    
    Required?                    false
    Position?                    2
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

-description <String>
    Specifies a description
    
    Required?                    false
    Position?                    3
    Default value                
    Accept pipeline input?       false
    Accept wildcard characters?  false

[<CommonParameters>]
    This script supports the common parameters: Verbose, Debug, ErrorAction, ErrorVariable, WarningAction, 
    WarningVariable, OutBuffer, PipelineVariable, and OutVariable.
```

Example
-------
```powershell
PS> ./new-shortcut C:\Temp\HDD C:\

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
	Creates a new shortcut file
.DESCRIPTION
	This PowerShell script creates a new shortcut file.
.PARAMETER shortcut
	Specifies the shortcut filename
.PARAMETER target
	Specifies the path to the target
.PARAMETER description
	Specifies a description
.EXAMPLE
	PS> ./new-shortcut C:\Temp\HDD C:\
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz | License: CC0
#>

param([string]$shortcut = "", [string]$target = "", [string]$description)

try {
	if ($shortcut -eq "" ) { $shortcut = read-host "Enter new shortcut filename" }
	if ($target -eq "" ) { $target = read-host "Enter path to target" }
	if ($description -eq "" ) { $description = read-host "Enter description" }

	$sh = new-object -ComObject WScript.Shell
	$sc = $sh.CreateShortcut("$shortcut.lnk")
	$sc.TargetPath = "$target"
	$sc.WindowStyle = "1"
	$sc.IconLocation = "C:\Windows\System32\SHELL32.dll, 3"
	$sc.Description = "$description"
	$sc.save()

	"✔️ created new shortcut $shortcut ⭢ $target"
	exit 0 # success
} catch {
	"⚠️ Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
```

*(generated by convert-ps2md.ps1 using the comment-based help of new-shortcut.ps1 as of 10/19/2023 08:11:40)*