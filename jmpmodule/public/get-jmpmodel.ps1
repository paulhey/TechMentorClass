function Get-JmpModel {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $data = Get-CimInstance -ClassName Win32_ComputerSystem @PSBoundParameters
  [PSCustomObject]@{
    Model = $data.Model
  }
}