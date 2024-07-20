return {
    {
        'rmagatti/auto-session',
        dependencies = {
            'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
        },
        priority = 300, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        opts = {
            auto_session_suppress_dirs = { "~/workspace", "~/Downloads", "/", "~/AppData", "~/Documents" },
            auto_session_enable_last_session = false,
            auto_restore_enabled = true,
            auto_save_enabled = true,
            auto_restore_lazy_delay_enabled = true,
            session_lens = {
                load_on_setup = false,
                theme_conf = { border = true },
                previewer = false,
                buftypes_to_ignore = {},
            },
        },
        config = function(_, opts)
            require('auto-session').setup(opts)
        end,
    },
}
