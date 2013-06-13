$packageName = "CAMLDesigner 2013"

try {  
  
  #download
  Install-ChocolateyZipPackage $packageName 'http://sharepoint.biwug.be/CamlDesigner2013/CamlDesigner2013.zip' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Write-Host "Download $packageName was sucessful"
  
  #desktop shortcut
  $folder = (split-path $myinvocation.mycommand.path)
  
  $path = join-path $folder "CamlDesigner2013.exe"

  Install-ChocolateyDesktopLink $path
  
  #done
  Write-ChocolateySuccess $packageName

} catch {
    Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw 
}