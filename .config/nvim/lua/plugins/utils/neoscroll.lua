return {
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        opts = {
            mappings = {
                "<C-u>", "<C-d>", "<C-b>", "<C-f>"
            }
        },
        config = function()
            local t = {}
            t['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '125' } }
            t['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '125' } }
            t['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '250' } }
            t['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '250' } }
            require('neoscroll.config').set_mappings(t)
        end
    },
}
