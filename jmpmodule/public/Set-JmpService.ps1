function Set-JmpService {
  [CmdletBinding()]
  param (
    # ComputerName
    [Parameter()]
    [string]
    $ComputerName,
    # ServiceName
    [Parameter(Mandatory)]
    [ValidateSet('BITS')]
    [string]
    $Name
  )

  $Command = @{
    ScriptBlock  = {
      param(
        [string]$Name
      )
      $service = Get-Service -Name $Name
      $service | Select-Object Name, Status

      foreach ($step in 0..1) {
        switch ($service.Status) {
          'Running' {
            $service | Set-Service -Status 'Stopped'
          }
          'Stopped' {
            $service | Set-Service -Status 'Running'
          }
          Default {
            Write-Host ("Can't do anything with Status: {0}" -f $_)
          }
        }
        # Add a delay
        Start-Sleep -Seconds 1

        $service = Get-Service -Name $Name
        $service | Select-Object Name, Status
      }
    }
    ComputerName = $ComputerName
    ArgumentList = @($Name)
  }

  [PSCustomObject]@{
    Services = if ($ComputerName) {
      Invoke-Command @Command
    } else {
      $Command['ScriptBlock'].Invoke($Command['ArgumentList'])
    }
  }
}
