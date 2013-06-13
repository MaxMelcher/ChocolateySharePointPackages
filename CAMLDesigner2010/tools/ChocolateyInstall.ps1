$packageName = "CAMLDesigner 2010"

try {  
  
  #download
  Install-ChocolateyZipPackage $packageName 'http://sharepoint.biwug.be/CamlDesigner/CamlDesigner.zip' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  Write-Host "Download $packageName was sucessful"
  
  #desktop shortcut
  $folder = (split-path $myinvocation.mycommand.path)
  
  $path = join-path $folder "CamlDesigner.exe"

  Install-ChocolateyDesktopLink $path
  
  #done
  Write-ChocolateySuccess $packageName

} catch {
    Write-ChocolateyFailure $packageName "$($_.Exception.Message)"
    throw 
}