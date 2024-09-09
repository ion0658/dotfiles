return {
    { "nvimtools/none-ls.nvim", lazy = true, },
    { "vim-test/vim-test",      lazy = true },
    {
        "jay-babu/mason-null-ls.nvim",
        version     = false,
        event       = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        opts_extend = { "ensure_installed" },
        opts        = {
            ensure_installed = {}
        },
    },
}
