function Get-JmpComputerName {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $Cmd = { $env:COMPUTERNAME }
  [PSCustomObject]@{
    ComputerName = if ($ComputerName){
      Invoke-Command -ScriptBlock $Cmd @PSBoundParameters
    } else {
      $Cmd.Invoke()
    }
  }
}