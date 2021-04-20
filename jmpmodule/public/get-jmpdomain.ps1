function Get-JmpDomain {
  [PSCustomObject]@{
    Domain = $env:USERDOMAIN
  }
}