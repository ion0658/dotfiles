local function close_neo_tree()
    local st, manager = pcall(require, "neo-tree.sources.manager")
    if not st then
        return
    end
    local state = manager.get_state "filesystem"
    if require("neo-tree.ui.renderer").window_exists(state) then
        vim.api.nvim_command "Neotree close"
    end
    vim.notify('closing neotree')
end

local function open_neo_tree()
    vim.notify('opening neotree')
    require 'neo-tree.sources.manager'.show('filesystem')
end

local function on_cwd_changed()
    local st, mgr = pcall(require, "neo-tree.sources.manager")
    if not st then
        return
    end
    local state = mgr.get_state "filesystem"
    if not require("neo-tree.ui.renderer").window_exists(state) then
        return
    end
    require("neo-tree.command").execute { dir = vim.uv.cwd() }
end

local function clear_hidden_buffers()
    local page = vim.api.nvim_get_current_tabpage()
    local windows = vim.api.nvim_tabpage_list_wins(page)
    local win_bufs = {}
    for _, w in ipairs(windows) do
        local buf = vim.api.nvim_win_get_buf(w)
        win_bufs[buf] = true
    end
    local all_bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(all_bufs) do
        if not win_bufs[buf] then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
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
            auto_session_suppress_dirs = { "~/", "~/workspace", "~/Downloads", "/", "~/AppData", "~/Documents" },
            auto_session_enable_last_session = true,
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
                clear_hidden_buffers,
            },
            post_restore_cmds = {
                open_neo_tree,
            },
            cwd_change_handling = {
                restore_upcoming_session = true,   -- Disabled by default, set to true to enable
                pre_cwd_changed_hook = function()
                end,                               -- already the default, no need to specify like this, only here as an example
                post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
                    on_cwd_changed()
                    require("lualine").refresh()   -- refresh lualine so the new session name is displayed in the status bar
                end,
            },
        },
        config = function(_, opts)
            vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
            require('auto-session').setup(opts)
        end,
    },
}
