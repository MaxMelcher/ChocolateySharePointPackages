$spdToken = "SharePointDesigner2013x64"

try 
{ 
	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	. (Join-Path $scriptPath "spd-utils.ps1")
	
	$xmlConfigPath = Join-Path $scriptPath "spd-chocolatey-uninstall.xml"
	
	SPDUninstall $xmlConfigPath $spdToken
	
	Write-ChocolateySuccess $spdToken
}
catch 
{
  	Write-ChocolateyFailure $spdToken "$($_.Exception.Message)"
  	throw 
}