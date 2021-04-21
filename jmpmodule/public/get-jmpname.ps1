function Get-JmpName {
  $me = whoami
  # Write-Host -ForegroundColor Cyan $me
  [PSCustomObject]@{
    UserName = $me
  }
}
