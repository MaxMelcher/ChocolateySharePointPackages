try 
{ 
	$targetUrl = "http://visualstudiogallery.msdn.microsoft.com/6daef348-197a-43f6-a091-95226e6ea5bc/file/97405/7/SPALM.SPSF.vsix"
	$targetFileName = [System.IO.Path]::GetFileName($targetUrl)

	Write "Loading and installing file:[$targetFileName] from URL:[$targetUrl]"
	Install-ChocolateyVsixPackage "SPSFOnline" $targetUrl 
	  
	Write-ChocolateySuccess 'SPSFOnline'
}
catch 
{
  	Write-ChocolateyFailure 'SPSFOnline' "$($_.Exception.Message)"
  	throw 
}