function Get-JmpBuildNumber {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $data = Get-CimInstance -ClassName Win32_OperatingSystem @PSBoundParameters
  [PSCustomObject]@{
    BuildNumber = $data.BuildNumber
  }
}