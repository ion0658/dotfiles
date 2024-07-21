return {
    {
        'Wansmer/treesj',
        keys = { '<leader>tjm', '<leader>tjj', '<leader>tjs' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
        config = function()
            require('treesj').setup({})
        end,
    }
}
