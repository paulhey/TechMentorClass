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
  $Args = $Name

  $Cmd = {
    param(
      [string]
      $Name
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
  [PSCustomObject]@{
    Services = if ($ComputerName){
      Invoke-Command -ScriptBlock $Cmd -ComputerName $ComputerName -ArgumentList $Args
    } else {
      $Cmd.Invoke($Args)
    }
  }
}