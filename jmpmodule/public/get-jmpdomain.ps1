function Get-JmpDomain {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  $Cmd = { $env:USERDOMAIN }
  [PSCustomObject]@{
    Domain = if ($ComputerName){
      Invoke-Command -ScriptBlock $Cmd @PSBoundParameters
    } else {
      $Cmd.Invoke()
    }
  }
}