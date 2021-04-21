function Get-JmpOperatingSystem {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $data = Get-CimInstance -ClassName Win32_OperatingSystem @PSBoundParameters
  [PSCustomObject]@{
    OperatingSystem = $data.Caption
  }
}