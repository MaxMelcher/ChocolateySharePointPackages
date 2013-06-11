
function GetSPDTmpInstallFolder() {

	$tmpFolder =  Join-Path $env:chocolateyPackageFolder "download"
	[void][System.IO.Directory]::CreateDirectory($tmpFolder)
	
	return $tmpFolder;
}

function SPDInstall($targetUrl, $mspConfigPath, $spdToken) {

	$setupFileName = "setup.exe"
	$tmpFolder = GetSPDTmpInstallFolder

	Write-Host "Downloading and unpacking SharePoint Designer from URL:[$targetUrl] to folder:[$tmpFolder]" -fore Green
    Install-ChocolateyPackage $spdToken 'exe' "/extract:$tmpFolder /quiet" $targetUrl
	
	Write-Host "Waiting for unpacking complete..." -fore Green
	
	$targetSetupFilePath =  Join-Path $tmpFolder $setupFileName
	SPDWaitForExtractProcess $targetSetupFilePath
	
	Write-Host "Installing SharePoint Designer ([$spdToken]) with MSP file:[$mspConfigPath]" -ForegroundColor Green
	& $targetSetupFilePath /adminfile "$mspConfigPath"
    
	SPDWaitForSetupProcess
}

function SPDUninstall($xmlConfigPath, $spdToken) {

	$setupFileName = "setup.exe"
	$tmpFolder = GetSPDTmpInstallFolder
	
	$targetSetupFilePath =  Join-Path $tmpFolder $setupFileName
	
	Write-Host "Uninstalling SharePoint Designer ([$spdToken]) with with config file:[$xmlConfigPath]" -ForegroundColor Green
	& $targetSetupFilePath /config "$xmlConfigPath" /uninstall "SharePointDesigner"
	
	SPDWaitForSetupProcess
}

function SPDWaitForExtractProcess($targetSetupFilePath) {

	$isTargetSetupFileExist = [System.IO.File]::Exists($targetSetupFilePath)
	
	$unpackIteratoins = 3
	$currentUnpackIteraion = 0;
	
    while($isTargetSetupFileExist -eq $false) 
    {
		if($currentUnpackIteraion -ge $unpackIteratoins)
		{
			break;
		}
	
        Write-Host "." -NoNewline
        Sleep 3
        $isTargetSetupFileExist = [System.IO.File]::Exists($targetSetupFilePath)
		
		$currentUnpackIteraion++
    }

	# we need delay as unpacking is async!
    for($i =0; $i -le 10; $i++)
	{
		Write-Host "." -NoNewline
	}
	Write-Host " Done!`n"

}

function SPDWaitForSetupProcess() {

	$setupProcess = Get-Process "setup" -ErrorAction SilentlyContinue  
	  
    while($setupProcess -ne $null) 
    {
		Write-Host "." -NoNewline
        Sleep 1

        $setupProcess = Get-Process "setup" -ErrorAction SilentlyContinue  
    }
	Write-Host " Done!`n"	
}