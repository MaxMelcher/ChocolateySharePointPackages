try 
{ 
	# could be found at
	# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{44478D64-5F45-45AD-B90C-CF47E7144C79}
	Uninstall-ChocolateyPackage 'SPCAF' 'msi' '{44478D64-5F45-45AD-B90C-CF47E7144C79} /norestart /qn' 	  
	
	Write-ChocolateySuccess "SPCAFOnline"
}
catch 
{
  	Write-ChocolateyFailure 'SPCAFOnline' "$($_.Exception.Message)"
  	throw 
}