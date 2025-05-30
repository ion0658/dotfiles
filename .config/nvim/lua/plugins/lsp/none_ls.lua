return {
    { "nvimtools/none-ls.nvim", version = "*", lazy = true, },
    { "vim-test/vim-test",      version = "*", lazy = true },
    {
        "jay-babu/mason-null-ls.nvim",
        version      = "*",
        lazy         = true,
        event        = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        dependencies = {
            { 'rcarriga/nvim-notify', lazy = true }
        },
        opts         = {
            automatic_installation = true,
        },
    },
}
