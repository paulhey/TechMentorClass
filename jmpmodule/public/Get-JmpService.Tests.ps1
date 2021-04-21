BeforeAll{
  . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Test Service function' {
  Context 'Named services' {
    It 'Expecting <name> to be <expected>' -ForEach @(
      @{Name = 'BITS'; Expected = 'Running' }
      @{Name = 'DHCP'; Expected = 'Running' }
    ) {
      (Get-JmpService -Name $name).Service.Status | Should -Be $expected
    }
  }
}