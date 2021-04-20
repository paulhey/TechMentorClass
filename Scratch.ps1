Get-Help -Name Get-ChildItem
$services = get-service

foreach ($s in $services){
  if ($s.Name -eq 'WinRM'){
    Write-Host "BINGO!"
  }
}