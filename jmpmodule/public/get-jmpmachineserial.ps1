function Get-JmpMachineSerial {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $data = Get-CimInstance -ClassName Win32_BIOS @PSBoundParameters
  [PSCustomObject]@{
    MachineSN = $data.SerialNumber
  }
}