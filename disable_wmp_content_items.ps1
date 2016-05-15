# remove the export folder/file if they exist
Remove-Item -Recurse -Force C:\TEMP\reg_export
Remove-Item C:\TEMP\export.reg

# list of keys to export
$keys = 'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shell\Enqueue',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shell\Play',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Image\shell\Enqueue',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Image\shell\Play',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Video\shell\Enqueue',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Video\shell\Play',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\audio\shell\Enqueue',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\audio\shell\Play',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\video\shell\Enqueue',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\video\shell\Play',
        'HKEY_CLASSES_ROOT\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\WMPShopMusic'


# create the export folder
New-Item -ItemType directory -Path C:\TEMP\reg_export

# folder and output file paths
$tempFolder = 'C:\TEMP\reg_export'
$outputFile = 'C:\TEMP\export.reg'

# create loop of exported reg files
$keys | % {
  $i++
  & reg export $_ "$tempFolder\$i.reg"
}

# run the export process
'Windows Registry Editor Version 5.00' | Set-Content $outputFile
Get-Content "$tempFolder\*.reg" | ? {
  $_ -ne 'Windows Registry Editor Version 5.00'
} | Add-Content $outputFile

# remove the temp directory
Remove-Item -Recurse -Force C:\TEMP\reg_export

# map HKEY_CLASSES_ROOT
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

# now remove the registry keys
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Audio\shell\Enqueue -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Audio\shell\Play -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Image\shell\Enqueue -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Image\shell\Play -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Video\shell\Enqueue -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Video\shell\Play -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\audio\shell\Enqueue -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\audio\shell\Play -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\video\shell\Enqueue -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\video\shell\Play -Recurse
Remove-Item -Path HKCR:\SystemFileAssociations\Directory.Audio\shellex\ContextMenuHandlers\WMPShopMusic -Recurse
