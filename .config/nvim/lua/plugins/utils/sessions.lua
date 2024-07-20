return {
    "natecraddock/sessions.nvim",
    events = { "WinEnter" },
    lazy = true,
    opts = {
        auto_session_suppress_dirs = { "~/workspace", "~/Downloads", "/", "~/AppData", "~/Documents" },
        auto_session_enable_last_session = true,
        auto_restore_enabled = true,
        auto_save_enabled = true,
        session_lens = {
            load_on_setup = false,
            theme_conf = { border = true },
            previewer = false,
            buftypes_to_ignore = {},
        },
    },
    config = true
}
