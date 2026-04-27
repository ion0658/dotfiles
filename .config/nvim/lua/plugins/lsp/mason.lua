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
            { 'neovim/nvim-lspconfig',    lazy = true },
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {
                "copilot",
            },
        },
        keys         = {
            { "gd",    "<cmd>lua vim.lsp.buf.definition()<cr>",      desc = "Goto Definition",        nowait = true },
            { "gr",    "<cmd>lua vim.lsp.buf.references()<cr>",      desc = "References",             nowait = true },
            { "gI",    "<cmd>lua vim.lsp.buf.implementation()<cr>",  desc = "Goto Implementation",    nowait = true },
            { "gy",    "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Goto T[y]pe Definition", nowait = true },
            { "gD",    "<cmd>lua vim.lsp.buf.declaration()<cr>",     desc = "Goto Declaration",       nowait = true },
            { "K",     "<cmd>lua vim.lsp.buf.hover()<cr>",           desc = "Hover",                  nowait = true },
            { "gK",    "<cmd>lua vim.lsp.buf.signature_help()<cr>",  desc = "Signature Help",         nowait = true },
            { "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>",  desc = "Signature Help",         nowait = true, mode = "i" },
        },
        config       = true
    },
}
