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

  $Args = $Name, $Count

  $Cmd = {
    param(
      [string]
      $Name,
      [int]
      $Count
    )
    Get-Service -Name $Name |
      Select-Object -First $Count
  }
  [PSCustomObject]@{
    Services = if ($ComputerName){
      Invoke-Command -ScriptBlock $Cmd -ComputerName $ComputerName -ArgumentList $Args
    } else {
      $Cmd.Invoke($Args)
    }
  }
}