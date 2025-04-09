# env.nu
#
# Installed by:
# version = "0.103.0"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

use std/util "path add"

$env.CARGO_HOME = ($env.XDG_DATA_HOME | path join 'cargo')
$env.RUSTUP_HOME = ($env.XDG_DATA_HOME | path join 'rustup')
$env.VOLTA_HOME = ($env.XDG_DATA_HOME | path join 'volta')
$env.SCCACHE_DIR = ($env.XDG_CACHE_HOME | path join 'sccache')
$env.DISCORD_USER_DATA_DIR = ($env.XDG_CONFIG_HOME | path join 'discord')
$env.GOPATH = ($env.XDG_DATA_HOME | path join '/go')
$env.NPM_CONFIG_USERCONFIG = ($env.XDG_CONFIG_HOME | path join 'npm/npmrc')
$env.NUGET_PACKAGES = ($env.XDG_CACHE_HOME | path join 'nuget')
$env.PYENV_ROOT = ($env.XDG_DATA_HOME | path join '.venv')
$env.PYENV_BIN = ($env.PYENV_ROOT | path join 'Scripts')
$env.STARSHIP_CONFIG = ($env.XDG_CONFIG_HOME | path join 'starship.toml')
$env.STARSHIP_CACHE = ($env.XDG_CACHE_HOME | path join 'starship')
$env._ZO_DATA_DIR = ($env.XDG_CACHE_HOME | path join 'zoxide')

path add ($env.CARGO_HOME | path join 'bin')
path add ($env.VOLTA_HOME | path join 'bin')
path add ($env.GOPATH | path join 'bin')
path add ($env.XDG_DATA_HOME | path join '..' | path join 'bin')

$env.config.shell_integration = {
    osc2: false
    osc7: false
    osc8: false
    osc9_9: false
    osc133: false
    osc633: false
    reset_application_mode: false
}
$env.config.buffer_editor = "nvim"
$env.config.history = {
    file_format: sqlite
    max_size: 1_000_000
    sync_on_enter: true
    isolation: true
}
