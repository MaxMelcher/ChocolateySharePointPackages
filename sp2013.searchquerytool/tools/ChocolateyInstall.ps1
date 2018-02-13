$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage "sp2013.searchquerytool" "https://github.com/SharePoint/PnP-Tools/blob/master/Solutions/SharePoint.Search.QueryTool/Releases/SearchQueryToolv2.7.zip?raw=true" "$scriptPath"
$exePath = Join-Path $scriptPath 'SearchQueryTool.exe'
  
Install-ChocolateyDesktopLink $exePath 
