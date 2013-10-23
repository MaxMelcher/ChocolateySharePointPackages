try 
{ 
	# could be found at
	# HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{44478D64-5F45-45AD-B90C-CF47E7144C79}
	Uninstall-ChocolateyPackage 'SPCAF' 'msi' '{1FAE356A-7D5A-B344-D95C-02F975D80AFC} /norestart /qn' 	  
	
	Write-ChocolateySuccess "SPCAF"
}
catch 
{
  	Write-ChocolateyFailure 'SPCAF' "$($_.Exception.Message)"
  	throw 
}