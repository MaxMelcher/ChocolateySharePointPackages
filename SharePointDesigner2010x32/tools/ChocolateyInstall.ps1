$spdToken = "SharePointDesigner2010x32"

try 
{ 
	# x32
	# http://download.microsoft.com/download/7/9/B/79B9134E-D725-41AC-A04A-053BA7F0D678/SharePointDesigner.exe
	# x64
	# http://download.microsoft.com/download/5/B/6/5B645118-85F5-41D6-8DB9-2B7BAB835A79/SharePointDesigner.exe

	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	. (Join-Path $scriptPath "spd-utils.ps1")

	$mspConfigPath = Join-Path $scriptPath "spd-chocolatey-install-x32.msp"
	$targetUrl = "http://download.microsoft.com/download/7/9/B/79B9134E-D725-41AC-A04A-053BA7F0D678/SharePointDesigner.exe"
	
	SPDInstall $targetUrl $mspConfigPath $spdToken

	Write-ChocolateySuccess $spdToken
}
catch 
{
  	Write-ChocolateyFailure $spdToken "$($_.Exception.Message)"
  	throw 
}
