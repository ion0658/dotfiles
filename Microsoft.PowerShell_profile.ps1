#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
function Check-Command($cmdname)
{
    return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

$Env:CARGO_HOME = "$Env:XDG_DATA_HOME\cargo"
$Env:RUSTUP_HOME = "$Env:XDG_DATA_HOME\rustup"
$Env:VOLTA_HOME = "$Env:XDG_DATA_HOME\volta"
$Env:SCCACHE_DIR = "$Env:XDG_CACHE_HOME\sccache"
$Env:DISCORD_USER_DATA_DIR = "$Env:XDG_CONFIG_HOME\discord"
$Env:GOPATH = "$Env:XDG_DATA_HOME\go"
$Env:NPM_CONFIG_USERCONFIG = "$Env:XDG_CONFIG_HOME\npm\npmrc"
$Env:NUGET_PACKAGES = "$Env:XDG_CACHE_HOME\nuget"
$Env:PYENV_ROOT = "$Env:XDG_DATA_HOME\.venv"
$Env:PYENV_BIN = "$Env:PYENV_ROOT\Scripts"

if(Check-Command -cmdname "starship") {
    Invoke-Expression (&starship init powershell)
}

if(Check-Command -cmdname "nvim") {
    Set-Alias vim nvim
}

if(Check-Command -cmdname "bat") {
    Set-Alias cat bat
}

if(Check-Command -cmdname "eza") {
    Set-Alias ls eza
}

if(Check-Command -cmdname "fd") {
    Set-Alias find fd
}

if(Check-Command -cmdname "rg") {
    Set-Alias grep rg
}
