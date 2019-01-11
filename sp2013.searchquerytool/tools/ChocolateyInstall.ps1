$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "SearchQueryTool"
  unzipLocation = $toolsDir
  url           = "https://github.com/SharePoint/PnP-Tools/blob/master/Solutions/SharePoint.Search.QueryTool/Releases/SearchQueryToolv2.8.2.zip?raw=true"

  checksum      = "527797173FB53A66016E29553756188096B4556BF6CD455020E58A104BC90997"
  checksumType  = "sha256"
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath "SearchQueryTool.exe"
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath "SearchQueryTool.lnk"
Install-ChocolateyShortcut `
   -ShortcutFilePath $shortcut `
   -TargetPath $target
