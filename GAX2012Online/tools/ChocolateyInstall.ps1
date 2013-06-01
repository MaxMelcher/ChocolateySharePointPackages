try 
{ 
	$targetUrl = "http://visualstudiogallery.msdn.microsoft.com/1412659a-622c-47a4-af1e-a3f75afdd79b/file/85798/1/GAX2010-VS2012.vsix"
	$targetFileName = [System.IO.Path]::GetFileName($targetUrl)

	Write "Loading and installing file:[$targetFileName] from URL:[$targetUrl]"
	Install-ChocolateyVsixPackage "GAX2012Online" $targetUrl 
	  
	Write-ChocolateySuccess 'GAX2012Online'
}
catch 
{
  	Write-ChocolateyFailure 'GAX2012Online' "$($_.Exception.Message)"
  	throw 
}