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

$env.DISCORD_USER_DATA_DIR = ($env.XDG_CONFIG_HOME | path join 'discord')
$env.NUGET_PACKAGES = ($env.XDG_CACHE_HOME | path join 'nuget')
$env.WEZTERM_CONFIG_DIR = ($env.XDG_CONFIG_HOME | path join 'wezterm')
$env.WEZTERM_CONFIG_FILE = ($env.WEZTERM_CONFIG_DIR | path join 'wezterm.lua')

path add '/opt/homebrew/bin'

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
