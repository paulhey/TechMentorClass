function Get-JmpPSVersion {
  [PSCustomObject]@{
    PowerShellVersion = $PSVersionTable.Version
  }
}