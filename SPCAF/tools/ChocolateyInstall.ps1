try 
{ 
	$targetUrl = "http://visualstudiogallery.msdn.microsoft.com/d3b2aaf7-0d6a-4995-a4e5-4153c57e3889/file/100303/13/SPCAF.Setup.4.1.1.1206.msi"
	$targetFileName = [System.IO.Path]::GetFileName($targetUrl)

	Write "Loading and installing file:[$targetFileName] from URL:[$targetUrl]"
	Install-ChocolateyPackage $targetUr 'msi' '/quiet' $targetUrl
	  
	Write-ChocolateySuccess 'SPCAF'
}
catch 
{
  	Write-ChocolateyFailure 'SPCAF' "$($_.Exception.Message)"
  	throw 
}