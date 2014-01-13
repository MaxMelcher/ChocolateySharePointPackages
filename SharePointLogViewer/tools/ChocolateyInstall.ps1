try { 
  
	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	$exePath = Join-Path $(Split-Path -parent $scriptPath) 'SharePointLogViewer.exe'
  
  	Install-ChocolateyDesktopLink $exePath 
 
  	Write-ChocolateySuccess 'SharePointLogViewer'
} catch {
  	Write-ChocolateyFailure 'SharePointLogViewer' "$($_.Exception.Message)"
  	throw 
}