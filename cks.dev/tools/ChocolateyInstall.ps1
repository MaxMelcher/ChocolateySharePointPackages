try { 
  
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$vsixPath = Join-Path $(Split-Path -parent $scriptPath) 'CKS.Dev.vsix'
  
VSIXInstaller.exe /q $vsixPath
 
  Write-ChocolateySuccess 'CKS.Dev.vsix'
} catch {
  Write-ChocolateyFailure 'CKS.Dev.vsix' "$($_.Exception.Message)"
  throw 
}