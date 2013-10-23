try 
{ 
	$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
	$msiPath = Join-Path $(Split-Path -parent $scriptPath) '/distr/CamlBuilderSetup.msi'
	
	Write "Loading and installing file:[$msiPath] from PATH:[$msiPath]"
	Install-ChocolateyPackage 'U2UCamlBuilder' 'msi' '/quiet' $msiPath 
	  
	Write-ChocolateySuccess 'U2UCamlBuilder'
}
catch 
{
  	Write-ChocolateyFailure 'U2UCamlBuilder' "$($_.Exception.Message)"
  	throw 
}