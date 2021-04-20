function Get-JmpOSArchitecture {
  $data = Get-CimInstance -ClassName Win32_OperatingSystem
  [PSCustomObject]@{
    OSArchitecture = $data.OSArchitecture
  }
}