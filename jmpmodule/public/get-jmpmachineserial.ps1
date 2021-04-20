function Get-JmpMachineSerial {
  $data = Get-CimInstance -ClassName Win32_BIOS
  [PSCustomObject]@{
    MachineSN = $data.SerialNumber
  }
}