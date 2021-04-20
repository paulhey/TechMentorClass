function Get-JmpBuildNumber {
  $data = Get-CimInstance -ClassName Win32_OperatingSystem
  [PSCustomObject]@{
    BuildNumber = $data.BuildNumber
  }
}