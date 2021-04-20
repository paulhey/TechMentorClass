function Get-JmpPSVersion {
  [PSCustomObject]@{
    PowerShellVersion = $PSVersionTable.PSVersion
  }
}