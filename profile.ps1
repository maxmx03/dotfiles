# node
fnm env --use-on-cd | Out-String | Invoke-Expression

# how to: scoop install oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\zash.omp.json" | Invoke-Expression

# github.com/yt-dlp/yt-dlp
Set-Alias -Name yt-dlp -Value "$HOME\yt-dlp.exe"

# Modules
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Force
    Write-Output "'Terminal-Icons' is installed"
} else {
    Import-Module Terminal-Icons
}

if (-not (Get-Module -ListAvailable -Name posh-git)) {
    Install-Module -Name posh-git -Scope CurrentUser -Force
    Write-Output "'posh-git' is installed"
} else {
    Import-Module posh-git
}
