function Get-JmpPCInfo {
  param ()
  $osInfo = Get-CimInstance -Class Win32_OperatingSystem

  [PSCustomObject]@{
    Version        = $osInfo.Version
    OSArchitecture = $osInfo.OSArchitecture
  }
}