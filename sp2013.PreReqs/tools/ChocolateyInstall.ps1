try 
{ 
	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	$downloadScriptPath = Join-Path $scriptPath "DownloadAllSP2013PreReqs.ps1"
	
	$targetFolder =  Join-Path $env:chocolateyPackageFolder "download"
	
	[System.IO.Directory]::CreateDirectory($targetFolder)
	
	Write "Downloading SharePoint 2013 prerequisite to folder:[$targetFolder]"
	& $downloadScriptPath $targetFolder 
	  
	Write "Downloading SharePoint 2013 prerequisite to folder:[$targetFolder] has been completed!"  
	Write-ChocolateySuccess 'SP2013PreReqsOnline'
}
catch 
{
  	Write-ChocolateyFailure 'SP2013PreReqsOnline' "$($_.Exception.Message)"
  	throw 
}