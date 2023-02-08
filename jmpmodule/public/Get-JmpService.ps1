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

  $Command = @{
    ScriptBlock  = {
      param(
        [string]$Name,
        [int]$Count
      )
      Get-Service -Name $Name |
        Select-Object -First $Count
    }
    ComputerName = $ComputerName
    ArgumentList = @($Name, $Count)
  }

  [PSCustomObject]@{
    Service = if ($ComputerName) {
      Invoke-Command @Command
    } else {
      $Command['ScriptBlock'].Invoke($Command['ArgumentList'])
    }
  }
}
