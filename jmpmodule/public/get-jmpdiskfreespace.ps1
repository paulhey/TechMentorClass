function Get-JmpDiskFreeSpace {
  Get-CimInstance -ClassName Win32_Volume |
    Where-Object { $null -ne $_.DriveLetter -and $null -ne $_.Capacity } |
    Select-Object DriveLetter, FreeSpace, Capacity, @{
      Name       = 'PercentFree'
      Expression = {
        $ratio = $_.FreeSpace / $_.Capacity
        '{0:p}' -f $ratio
      }
    }
}