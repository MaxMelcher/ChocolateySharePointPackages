$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "SearchQueryTool"
  unzipLocation = $toolsDir
  url           = "https://github.com/SharePoint/PnP-Tools/releases/download/v2.8.4-Search-QueryTool/SearchQueryToolv2.8.4.zip"

  checksum      = "1E9F2288CEDAB95533C8694F90CE29C3D782A250BCECBFA8EC4C98D5DED05835"
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
