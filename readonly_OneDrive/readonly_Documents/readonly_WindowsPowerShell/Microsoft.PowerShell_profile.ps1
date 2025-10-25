$PSStyle.FileInfo.Directory = $PSStyle.Foreground.Blue

oh-my-posh init pwsh --config "$HOME\OneDrive\Documents\PowerShell\myprompt.toml" | Invoke-Expression
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
	Import-Module "$ChocolateyProfile"
}


# ~~~~~~~~~~~~Aliases~~~~~~~~~~~~~~~~~~~~#

Set-Alias -name c -value Clear-Host
Set-Alias -name ll -value Get-ChildItem -Force

function pshell { z "$HOME\OneDrive\Documents\PowerShell" }
function brain { z "$HOME\Documents\My-Brain\" }
function repo-pull {
	
	Write-Host "`nPulling repo My-Brain." -ForegroundColor Green
	z "$HOME\Documents\My-Brain\"
	git pull
	z
	Write-Host "`nPulling repo PowerShell." -ForegroundColor Green
	z "$HOME\OneDrive\Documents\PowerShell"
	git pull
	z
}
function repo-push {
	Write-Host "`nPushing repo My-Brain." -ForegroundColor Green
	z "$HOME\Documents\My-Brain\"
	git add .
	git commit -m "Automatic Commit"
	git push
	z
	Write-Host "`nPushing repo PowerShell." -ForegroundColor Green
	z "$HOME\OneDrive\Documents\PowerShell"
	git add .
	git commit -m "Automatic Commit"
	git push
	z
}

# Open WinUtil full-release
function winutil {
	Invoke-RestMethod https://christitus.com/win | iex
}


Invoke-Expression (& { (zoxide init powershell | Out-String) })