local wezterm = require("wezterm")
local launch_menu = {}
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'iceberg-dark'
config.window_background_opacity = 0.9
config.window_padding = {
    left = 20,
    right = 20,
    top = 20,
    bottom = 20,
}
-- ui settings
config.font = wezterm.font_with_fallback({
    "Cascadia Code NF",
})
config.font_size = 16.0
config.use_ime = true
config.enable_scroll_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- start with window maximized
wezterm.on('gui-startup', function(cmd)
    local _tab, _pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

-- keybindings
config.leader = { key = "q", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
    {
        key = 'Enter',
        mods = 'ALT',
        action = wezterm.action.ToggleFullScreen,
    },
    {
        key = 'C',
        mods = 'CTRL',
        action = wezterm.action.CopyTo 'Clipboard',
    },
    {
        key = 'V',
        mods = 'CTRL',
        action = wezterm.action.PasteFrom 'Clipboard',
    },
    {
        mods = "LEADER",
        key = "t",
        action = wezterm.action.ShowLauncher,
    },
    {
        key = "t",
        mods = "SHIFT|CTRL",
        action = wezterm.action.SpawnTab("CurrentPaneDomain"),
    },
    {
        -- close pane with cmd+w
        key = "w",
        mods = "ALT|CTRL",
        action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },
    {
        -- split pane with cmd+alt+,
        key = ",",
        mods = "ALT|CTRL",
        action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
    },
    {
        -- split pane with cmd+alt+.
        key = ".",
        mods = "ALT|CTRL",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    -- Alt Ctrl hjklでペインの移動
    {
        key = "h",
        mods = "ALT|CTRL",
        action = wezterm.action.ActivatePaneDirection("Left"),
    },
    {
        key = "j",
        mods = "ALT|CTRL",
        action = wezterm.action.ActivatePaneDirection("Down"),
    },
    {
        key = "k",
        mods = "ALT|CTRL",
        action = wezterm.action.ActivatePaneDirection("Up"),
    },
    {
        key = "l",
        mods = "ALT|CTRL",
        action = wezterm.action.ActivatePaneDirection("Right"),
    },
}

-- for windows
if wezterm.target_triple:find("msvc") then
    config.wsl_domains = {
        {
            name = "WSL:ArchLinux",
            distribution = "ArchLinux",
            default_cwd = "~",
        },
    }
    launch_menu = {
        {
            label = "PowerShell",
            args = { "pwsh.exe", "-NoLogo" },
        },
        {
            label = "cmd",
            args = { "cmd.exe" },
        },
        {
            label = "NuShell",
            args = { "nu.exe" },
        },
    }
    config.default_prog = { "nu" }
end

config.launch_menu = launch_menu
return config
