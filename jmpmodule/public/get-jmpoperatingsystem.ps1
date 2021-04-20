function Get-JmpOperatingSystem {
  $data = Get-CimInstance -ClassName Win32_OperatingSystem
  [PSCustomObject]@{
    OperatingSystem = $data.Caption
  }
}