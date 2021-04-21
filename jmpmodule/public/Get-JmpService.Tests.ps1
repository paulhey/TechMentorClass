BeforeAll{
  . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe 'Test Service function' {
  Context 'Named services' {
    It 'Returns <expected> (<name>)' -Foreach @(
      @{Name = 'BITS'; Expected = 'BITS' }
      @{Name = 'DHCP'; Expected = 'DHCP' }
    ) {
      (Get-JmpService -Name $name).Service.Name | Should -Be $expected
    }
  }
}