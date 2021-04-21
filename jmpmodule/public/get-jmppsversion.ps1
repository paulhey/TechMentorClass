function Get-JmpPSVersion {
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $Cmd = { $PSVersionTable.PSVersion }
  [PSCustomObject]@{
    PowerShellVersion = if ($ComputerName) {
      Invoke-Command -ScriptBlock $Cmd @PSBoundParameters
    } else {
      $Cmd.Invoke()
    }
  }
}