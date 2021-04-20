function Get-JmpOSVersion {
  [PSCustomObject]@{
    Version = [system.environment]::OSVersion.VersionString
  }
}