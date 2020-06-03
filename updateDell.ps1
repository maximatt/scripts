cd C:\Dell
$CurrentLocation=Get-Location

function updateDell{
	Write-Host ".:: Update Dell ::."  -ForegroundColor Cyan
	if(-not (Test-Path "DellCommandUpdateSettings.xml")){
		& "$($Env:ProgramFiles)\Dell\CommandUpdate\dcu-cli.exe" /configure -exportSettings="$($CurrentLocation)"
	}
	# error code 500: no updates found
	& "$($Env:ProgramFiles)\Dell\CommandUpdate\dcu-cli.exe" /scan -report="$($CurrentLocation)" -outputLog="$($CurrentLocation)\scanOutput.log"
	& "$($Env:ProgramFiles)\Dell\CommandUpdate\dcu-cli.exe" /applyUpdates -reboot=disable
}

function updateWindows{
	Write-Host ".:: Update Windows ::." -ForegroundColor Cyan
	Import-Module PSWindowsUpdate
	Get-WUList
	Install-WindowsUpdate -MicrosoftUpdate -AcceptAll
	Get-wurebootstatus
}

function updateApplications{
	Write-Host ".:: Update Applications ::." -ForegroundColor Cyan
	choco upgrade all -y
}

updateApplications
updateWindows
updateDell