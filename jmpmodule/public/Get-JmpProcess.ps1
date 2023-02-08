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

  $Command = @{
    ScriptBlock  = {
      param(
        [string[]]$Property,
        [switch]$Descending,
        [int]$Count
      )
      Get-Process |
        Sort-Object -Property $Property -Descending:$Descending |
        Select-Object -First $Count
    }
    ComputerName = $ComputerName
    ArgumentList = @($SortProperty, !$Descending, $Count)
  }

  [PSCustomObject]@{
    Processes = if ($ComputerName) {
      Invoke-Command @Command
    } else {
      $Command['ScriptBlock'].Invoke($Command['ArgumentList'])
    }
  }
}
