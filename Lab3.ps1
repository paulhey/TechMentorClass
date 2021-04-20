$computerName = $env:COMPUTERNAME

function Get-ComputerName {
  param ()
  $env:COMPUTERNAME
  Write-Host -ForegroundColor Red ('Hello World! My Computer is {0}' -f $computerName)
}

function Get-MyService {
  param (
    # Service Name
    [Parameter()]
    [string]
    $Service
  )
  get-service -name $Service | Select-Object Name, Status
}

function Get-AService {
  [CmdletBinding()]
  param (
    # Service Name
    [Parameter()]
    [string]
    $Service
  )

  begin {
    Write-Host 'Begin' -ForegroundColor Green
  }

  process {
    Get-MyService -Service $Service
  }

  end {
    Write-Host 'End' -ForegroundColor Green
  }
}