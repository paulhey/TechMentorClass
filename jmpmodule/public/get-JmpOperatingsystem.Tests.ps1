BeforeAll{
  . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Test OperatingSystem function' {
  Context 'No Parameters' {
    It 'When running on Windows 10' {
      (Get-JmpOperatingSystem).OperatingSystem |
        Should -Be 'Microsoft Windows 10 Enterprise'
    }
  }
}