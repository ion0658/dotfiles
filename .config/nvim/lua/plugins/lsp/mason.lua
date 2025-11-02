return {
    {
        "mason-org/mason-registry",
        version = "*",
        lazy    = true,
    },
    {
        "mason-org/mason.nvim",
        version      = "*",
        lazy         = true,
        cmd          = "Mason",
        keys         = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build        = ":MasonUpdate",
        config       = true,
        dependencies = {
            { 'rcarriga/nvim-notify',     lazy = true },
            { 'mason-org/mason-registry', lazy = true },
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        version      = "*",
        lazy         = true,
        event        = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        dependencies = {
            { 'rcarriga/nvim-notify',     lazy = true },
            { 'saghen/blink.cmp',         lazy = true },
            { 'mason-org/mason.nvim',     lazy = true },
            { 'mason-org/mason-registry', lazy = true },
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {
                "copilot",
            },
        },
        config       = true
    },
}
