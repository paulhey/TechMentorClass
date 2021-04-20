function Get-JmpComputerName {
  [PSCustomObject]@{
    ComputerName = $env:COMPUTERNAME
  }
}