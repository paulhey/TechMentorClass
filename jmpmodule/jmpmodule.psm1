# Import all of the function scripts
$Scripts = Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -Exclude *.tests.ps1, *profile.ps1
foreach ($item in $Scripts) {
  . $item.FullName
}