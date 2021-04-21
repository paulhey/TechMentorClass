function Get-JmpService {
  [CmdletBinding()]
  param (
    # ComputerName
    [Parameter()]
    [string]
    $ComputerName,
    # ServiceName
    [Parameter(Mandatory)]
    # [ValidateSet('BITS')]
    [string]
    $Name,
    # Count
    [Parameter()]
    [int]
    $Count = 5
  )
  $Cmd = {
    Get-Service -Name $using:Name |
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