return {
    { "nvimtools/none-ls.nvim", version = "*", lazy = true, },
    { "vim-test/vim-test",      version = "*", lazy = true },
    {
        "jay-babu/mason-null-ls.nvim",
        version      = "*",
        lazy         = true,
        event        = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        dependencies = {
            { 'rcarriga/nvim-notify',     lazy = true },
            { 'mason-org/mason.nvim',     lazy = true },
            { 'mason-org/mason-registry', lazy = true },
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {},
            automatic_installation = true,
        },
        config       = true
    },
}
