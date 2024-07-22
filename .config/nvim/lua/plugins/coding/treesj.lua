return {
    {
        'Wansmer/treesj',
        keys = {
            { '<leader>tjm', '<cmd>TSJToggle<cr>', desc = 'Toggle Treesj' },
            { '<leader>tjj', '<cmd>TSJJoin<cr>',   desc = 'Join Treesj' },
            { '<leader>tjs', '<cmd>TSJSplit<cr>',  desc = 'Split Treesj' }
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
        opts = {
            use_default_keymap = false,
        },
        config = function(_, opts)
            require('treesj').setup(opts)
        end,
    }
}
