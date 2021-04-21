using namespace System.Management.Automation
# See https://vexx32.github.io/2018/11/29/Dynamic-ValidateSet/
# Used to validate Template parameters
# Classes need to go to the top of the module
class ValidProcessProperty : IValidateSetValuesGenerator {
  [string[]] GetValidValues() {
    return (
      Get-Process |
        Get-Member -Type Property, ScriptProperty |
        Select-Object -ExpandProperty Name
    )
  }
}

function Get-JmpProcess {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName,
    # SortProperty
    [Parameter()]
    [ValidateSet( [ValidProcessProperty] )]
    [string[]]
    $SortProperty = @('CPU'),
    # Count
    [Parameter()]
    [int]
    $Count = 5,
    # Sort Mode
    [Parameter()]
    [switch]
    $Descending
  )
  $Cmd = {
    Get-Process |
      Sort-Object -Property $SortProperty -Descending $using:Descending -P |
      Select-Object -First $using:Count
  }
  [PSCustomObject]@{
    Services = if ($ComputerName){
      Invoke-Command -ScriptBlock $Cmd -ComputerName $ComputerName
    } else {
      $Cmd.Invoke()
    }
  }
}