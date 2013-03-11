try { 
  
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$exePath = Join-Path $(Split-Path -parent $scriptPath) 'SearchQueryTool.exe'
  
  Install-ChocolateyDesktopLink $exePath 
 
  Write-ChocolateySuccess 'SearchQueryTool'
} catch {
  Write-ChocolateyFailure 'SearchQueryTool' "$($_.Exception.Message)"
  throw 
}