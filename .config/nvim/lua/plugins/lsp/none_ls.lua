return {
    { "nvimtools/none-ls.nvim", version = false, lazy = true, },
    { "vim-test/vim-test",      version = false, lazy = true },
    {
        "jay-babu/mason-null-ls.nvim",
        version      = false,
        lazy         = true,
        event        = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        dependencies = {
            { 'rcarriga/nvim-notify', lazy = true }
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {}
        },
    },
}

