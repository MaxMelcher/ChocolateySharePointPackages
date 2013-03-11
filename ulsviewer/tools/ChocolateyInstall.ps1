try { 
  
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$exePath = Join-Path $(Split-Path -parent $scriptPath) 'UlsViewer.exe'
  
  Install-ChocolateyDesktopLink $exePath 
 
  Write-ChocolateySuccess 'UlsViewer'
} catch {
  Write-ChocolateyFailure 'UlsViewer' "$($_.Exception.Message)"
  throw 
}