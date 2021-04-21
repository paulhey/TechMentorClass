function Get-JmpOSVersion {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $Cmd = { [system.environment]::OSVersion.VersionString }
  [PSCustomObject]@{
    Version = if ($ComputerName) {
      Invoke-Command -ScriptBlock $Cmd @PSBoundParameters
    } else {
      $Cmd.Invoke()
    }
  }
}