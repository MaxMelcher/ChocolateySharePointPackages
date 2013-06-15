$spdToken = "SharePointDesigner2013x32"

try 
{ 
	#http://download.microsoft.com/download/3/E/3/3E383BC4-C6EC-4DEA-A86A-C0E99F0F3BD9/sharepointdesigner_32bit.exe
	#http://download.microsoft.com/download/3/E/3/3E383BC4-C6EC-4DEA-A86A-C0E99F0F3BD9/sharepointdesigner_64bit.exe

	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	. (Join-Path $scriptPath "spd-utils.ps1")

	$mspConfigPath = Join-Path $scriptPath "spd-chocolatey-install-x32.msp"
	$targetUrl = "http://download.microsoft.com/download/3/E/3/3E383BC4-C6EC-4DEA-A86A-C0E99F0F3BD9/sharepointdesigner_32bit.exe"
	
	SPDInstall $targetUrl $mspConfigPath $spdToken

	Write-ChocolateySuccess $spdToken
}
catch 
{
  	Write-ChocolateyFailure $spdToken "$($_.Exception.Message)"
  	throw 
}
