function Get-JmpModel {
  $data = Get-CimInstance -ClassName Win32_ComputerSystem
  [PSCustomObject]@{
    Model = $data.Model
  }
}