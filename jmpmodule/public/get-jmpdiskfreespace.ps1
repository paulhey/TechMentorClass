function Get-JmpDiskFreeSpace {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $ComputerName
  )

  Get-CimInstance -ClassName Win32_Volume @PSBoundParameters |
    Where-Object { $null -ne $_.DriveLetter -and $null -ne $_.Capacity } |
    Select-Object DriveLetter, FreeSpace, Capacity, @{
      Name       = 'PercentFree'
      Expression = {
        $ratio = $_.FreeSpace / $_.Capacity
        '{0:p}' -f $ratio
      }
    }
}