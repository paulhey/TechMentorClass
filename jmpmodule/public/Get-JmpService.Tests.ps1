BeforeAll{
  . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Test Service function' {
  Context 'Named services' {
    It 'Returns <expected> (<name>)' -ForEach @(
      @{Name = 'BITS'; Expected = 'BITS' }
      @{Name = 'DHCP'; Expected = 'DHCP' }
    ) {
      (Get-JmpService -Name $name).Services | Should -Be $expected
    }
  }
}