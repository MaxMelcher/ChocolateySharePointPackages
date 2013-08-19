try 
{ 
	# could be found at
	# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{DD5E9E79-47CC-4FC6-97E2-42E3824A9FFF}
	Uninstall-ChocolateyPackage 'U2UCamlBuilder' 'msi' '{DD5E9E79-47CC-4FC6-97E2-42E3824A9FFF} /norestart /qn' 	  
	
	Write-ChocolateySuccess "U2UCamlBuilder"
}
catch 
{
  	Write-ChocolateyFailure 'U2UCamlBuilder' "$($_.Exception.Message)"
  	throw 
}