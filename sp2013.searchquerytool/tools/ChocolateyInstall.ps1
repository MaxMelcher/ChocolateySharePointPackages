$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "SearchQueryTool"
  unzipLocation = $toolsDir
  url           = "https://github.com/pnp/PnP-Tools/releases/download/v2.8.7-Search-QueryTool/SearchQueryToolv2.8.7.zip"

  checksum      = "37D3DBCC5053FD474F957A435FC83E862410B1548E7D6EC7369F2932945DA4B8"
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
