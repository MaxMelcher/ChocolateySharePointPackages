try 
{ 
	$programmFilesPath = $Env:ProgramFiles
	  
	$webInstallerPath = Join-Path $Env:ProgramFiles "Microsoft\Web Platform Installer"
	$WebpiCmdPath = Join-Path $webInstallerPath "WebpiCmd.exe"
	
	$tempOfficeToolsDir = Join-Path $env:TEMP "chocolatey_OfficeToolsForVS2012RTW_Install"
	$tempOfficeToolsInstallerPath = Join-Path $tempOfficeToolsDir "bin\WebpiCmd.exe"
	
	Write "Creating temp folder: [$tempOfficeToolsDir]"
	if (![System.IO.Directory]::Exists($tempOfficeToolsDir)) {[System.IO.Directory]::CreateDirectory($tempOfficeToolsDir)}
	
  	Write "Downloading OfficeToolsForVS2012RTW distributives..."
 	& $WebpiCmdPath /offline /products:OfficeToolsForVS2012RTW /Path:$tempOfficeToolsDir
  	Write "Downloading OfficeToolsForVS2012RTW completed!"
  
  	Write "Installing OfficeToolsForVS2012RTW distributives..."
  	& $tempOfficeToolsInstallerPath /install /accepteula /products:OfficeToolsForVS2012RTW
	Write "Installing OfficeToolsForVS2012RTW completed!"
	 
	Write-ChocolateySuccess 'OfficeToolsForVS2012RTWOnline'
}
catch 
{
  	Write-ChocolateyFailure 'OfficeToolsForVS2012RTWOnline' "$($_.Exception.Message)"
  	throw 
}