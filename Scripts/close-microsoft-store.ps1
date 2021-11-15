﻿<#
.SYNOPSIS
	Closes the Microsoft Store app
.DESCRIPTION
	This script closes the Microsoft Store application gracefully.
.EXAMPLE
	PS> ./close-microsoft-store
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

TaskKill /im WinStore.App.exe /f /t
if ($lastExitCode -ne "0") {
	& "$PSScriptRoot/speak-english.ps1" "Sorry, can't close Microsoft Store"
	exit 1
}
exit 0 # success
