try { 
  
$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$vsixPath = Join-Path $(Split-Path -parent $scriptPath) 'CKS.Dev.Server.vsix'

if ($env:VS110COMNTOOLS)
{
	$installer = $(Split-Path -parent $env:VS110COMNTOOLS)
}
elseif ($env:VS100COMNTOOLS)
{
$installer = $(Split-Path -parent $env:VS110COMNTOOLS)
}
else
{
	throw "No Visual Studio found."
}

$installer = "$installer\IDE\VSIXInstaller.exe";
Write-Host "Starting $installer..."

& $installer "/q" $vsixPath
 


  Write-ChocolateySuccess 'CKS.Dev.Server.vsix'
} catch {
  Write-ChocolateyFailure 'CKS.Dev.Server.vsix' "$($_.Exception.Message)"
  throw 
}