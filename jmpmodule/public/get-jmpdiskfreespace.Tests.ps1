BeforeAll{
  . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Test DiskFreeSpace function' {
  Context 'No Parameters' {
    It 'C: Should have more than 10GB free' {
      $disk = Get-JmpDiskFreeSpace
      $disk.where({ $_.DriveLetter -eq 'C:' }).FreeSpace |
        Should -BeGreaterOrEqual (10 * 1024 * 1024 * 1024)
    }
  }
}