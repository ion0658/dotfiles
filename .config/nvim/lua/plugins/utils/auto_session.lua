local function close_neo_tree()
    require 'neo-tree.sources.manager'.close_all()
    vim.notify('closed all')
end

local function open_neo_tree()
    vim.notify('opening neotree')
    require 'neo-tree.sources.manager'.show('filesystem')
end

return {
    {
        'rmagatti/auto-session',
        enabled = true,
        dependencies = {
            "nvim-neo-tree/neo-tree.nvim",
            'nvim-telescope/telescope.nvim', -- Only needed if you want to use sesssion lens
        },
        priority = 100,                      -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        opts = {
            auto_session_suppress_dirs = { "~/workspace", "~/Downloads", "/", "~/AppData", "~/Documents" },
            auto_session_enable_last_session = false,
            auto_restore_enabled = true,
            auto_save_enabled = true,
            auto_restore_lazy_delay_enabled = true,
            session_lens = {
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
                buftypes_to_ignore = {},
            },
            bypass_session_save_file_types = { "neo-tree" },
            pre_save_cmds = {
                close_neo_tree,
            },
            post_restore_cmds = {
                open_neo_tree,
            }
        },
        config = function(_, opts)
            require('auto-session').setup(opts)
        end,
    },
}
