<#
1. Create a function to display the following info:
ComputerName
Domain
OperatingSystem
Model
MachineSN
Version
BuildNumber
OSArchitecture
PowerShellVersion
DiskFreeSpace

2. Break function out by CIM classes and put into private/public structure

#>

# Import all of the public function scripts
$PublicScripts = Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -Exclude *.tests.ps1, *profile.ps1
foreach ($item in $PublicScripts) {
  . $item.FullName
}

function Get-JmpSystemInfo {
  [PSCustomObject]@{
    ComputerName      = (Get-JmpComputerName).ComputerName
    Domain            = (Get-JmpDomain).Domain
    OperatingSystem   = (Get-JmpOperatingSystem).OperatingSystem
    Model             = (Get-JmpModel).Model
    MachineSN         = (Get-JmpMachineSerial).MachineSN
    Version           = (Get-JmpOSVersion).Version
    BuildNumber       = (Get-JmpBuildNumber).BuildNumber
    OSArchitecture    = (Get-JmpOSArchitecture).OSArchitecture
    PowerShellVersion = (Get-JmpPSVersion).PowerShellVersion
    DiskFreeSpace     = (Get-JmpDiskFreeSpace)
  }
}