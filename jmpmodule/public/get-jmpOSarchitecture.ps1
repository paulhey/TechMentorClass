function Get-JmpOSArchitecture {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $data = Get-CimInstance -ClassName Win32_OperatingSystem @PSBoundParameters
  [PSCustomObject]@{
    OSArchitecture = $data.OSArchitecture
  }
}