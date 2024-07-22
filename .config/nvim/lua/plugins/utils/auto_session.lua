local function close_neo_tree()
    require 'neo-tree.sources.manager'.close_all()
    vim.notify('closed all')
end

local function delete_all_buffer()
    vim.cmd('silent! %bd!') -- delete all buffers
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
            post_save_cmds = {
                delete_all_buffer,
            },
            post_restore_cmds = {
                open_neo_tree,
            },
            cwd_change_handling = {
                restore_upcoming_session = true, -- Disabled by default, set to true to enable
                pre_cwd_changed_hook = function()
                    delete_all_buffer()
                end,                               -- already the default, no need to specify like this, only here as an example
                post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
                    require("lualine").refresh()   -- refresh lualine so the new session name is displayed in the status bar
                    vim.cmd('silent! bd!')         -- delete
                end,
            },
        },
        config = function(_, opts)
            vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
            require('auto-session').setup(opts)
        end,
    },
}
