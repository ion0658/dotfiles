return {
    {
        'Wansmer/treesj',
        keys = {
            { '<leader>tjm', '<cmd>TSJToggle<cr>', desc = 'Toggle Treesj' },
            { '<leader>tjj', '<cmd>TSJJoin<cr>',   desc = 'Join Treesj' },
            { '<leader>tjs', '<cmd>TSJSplit<cr>',  desc = 'Split Treesj' }
        },
        opts = {
            use_default_keymap = false,
        },
    }
}
