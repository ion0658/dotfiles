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

local function on_change_cwd()
    local st, mgr = pcall(require, "neo-tree.sources.manager")
    if not st then
        vim.notify("NeoTree is not installed", vim.log.levels.ERROR)
        return
    end
    local state = mgr.get_state "filesystem"
    if not require("neo-tree.ui.renderer").window_exists(state) then
        vim.notify("NeoTree is not open", vim.log.levels.ERROR)
        return
    end
    vim.notify("change cwd to " .. vim.uv.cwd())
    require("neo-tree.command").execute { dir = vim.uv.cwd() }
    require("lualine").refresh()
end

local function clear_hidden_buffers()
    local buffers = vim.fn.tabpagebuflist()
    local dont_close_buffers = {}
    for _, b in ipairs(buffers) do
        dont_close_buffers[b] = true
        vim.notify('buffer ' .. b)
    end
    local all_bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(all_bufs) do
        if not dont_close_buffers[buf] then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end

local function delete_shadata()
    local shada_path = vim.fn.expand(vim.fn.stdpath "data" .. "/shada")
    local files = vim.fn.glob(shada_path .. "/*", false, true)
    local all_success = 0
    for _, file in ipairs(files) do
        local file_name = vim.fn.fnamemodify(file, ":t")
        if file_name == "main.shada" then
            goto continue
        end
        local success = vim.fn.delete(file)
        all_success = all_success + success
        if success ~= 0 then
            vim.notify("Couldn't delete file '" .. file_name .. "'", vim.log.levels.WARN)
        end
        ::continue::
    end
    if all_success == 0 then
        vim.print "Successfully deleted all temporary shada files"
    end
end

local function disable_incline()
    local p = require('incline')
    p.disable()
end
local function enable_incline()
    local p = require('incline')
    p.enable()
    p.refresh()
end

return {
    {
        'rmagatti/auto-session',
        version = false,
        lazy = false,
        event = { "VimEnter" },
        opts = {
            suppressed_dirs = { "~/", "~/workspace", "~/Downloads", "/", "~/AppData", "~/Documents" },
            auto_session_last_session = false,
            auto_restore = true,
            auto_save = true,
            lazy_support = true,
            session_lens = {
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
                buftypes_to_ignore = {},
            },
            bypas_save_filetypes = { "neo-tree" },
            pre_save_cmds = {
                close_neo_tree,
                disable_incline
            },
            post_restore_cmds = {
                open_neo_tree,
                on_change_cwd,
                delete_shadata
            },
            cwd_change_handling = {
                pre_cwd_changed_hook = function()
                    close_neo_tree()
                    disable_incline()
                    clear_hidden_buffers()
                end,
                post_cwd_changed_hook = function()
                    on_change_cwd()
                    clear_hidden_buffers()
                    enable_incline()
                end
            }
        },
        config = function(_, opts)
            vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
            require('auto-session').setup(opts)
        end,
    },
}
