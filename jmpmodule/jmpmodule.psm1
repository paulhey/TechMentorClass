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

3. Modify your function to accept ComputerName as a parameter; as [string[]].

4. Using Invoke-Command, return
  - the top N Services beginning with "S"
  - the top N Processes sorted by option "CPU"

5. Using sessions to return the status of BITS
6. Write a function to check the status of BITS, toggle the status. Run this function using a PSSession.
7. Toggle the existence of a file.
#>

# Import all of the public function scripts
$PublicScripts = Get-ChildItem -Path $PSScriptRoot\public\*.ps1 -Exclude *.tests.ps1, *profile.ps1
foreach ($item in $PublicScripts) {
  . $item.FullName
}

function Get-JmpSystemInfo {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string[]]
    $ComputerName
  )

  # Build a list of parameter splats
  $Splats = @(
    foreach ($Name in $ComputerName) {
      @{
        ComputerName = $Name
      }
    })

  # If we're not passing any names we should run locally.
  # So create an empty splat for the local system.
  if ($Splats.Count -eq 0){
    $Splats = @( @{} )
  }

  foreach ($Splat in $Splats) {
    [PSCustomObject]@{
      ComputerName      = (Get-JmpComputerName @Splat).ComputerName
      Domain            = (Get-JmpDomain @Splat).Domain
      OperatingSystem   = (Get-JmpOperatingSystem @Splat).OperatingSystem
      Model             = (Get-JmpModel @Splat).Model
      MachineSN         = (Get-JmpMachineSerial @Splat).MachineSN
      Version           = (Get-JmpOSVersion @Splat).Version
      BuildNumber       = (Get-JmpBuildNumber @Splat).BuildNumber
      OSArchitecture    = (Get-JmpOSArchitecture @Splat).OSArchitecture
      PowerShellVersion = (Get-JmpPSVersion @Splat).PowerShellVersion
      DiskFreeSpace     = (Get-JmpDiskFreeSpace @Splat)
    }
  }
}