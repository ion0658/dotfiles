return {
    {
        "williamboman/mason.nvim",
        version      = "*",
        lazy         = true,
        cmd          = "Mason",
        keys         = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build        = ":MasonUpdate",
        config       = true,
        dependencies = {
            { 'rcarriga/nvim-notify', lazy = true }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version      = "*",
        lazy         = true,
        event        = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        dependencies = {
            { 'rcarriga/nvim-notify', lazy = true },
            { 'saghen/blink.cmp',     lazy = true }
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {},
        },
        config       = function(_, opts)
            local blink = require("blink.cmp")
            local mason_config = require("mason-lspconfig")
            mason_config.setup(opts)
            mason_config.setup_handlers {
                function(server_name)
                    local config = {}
                    config.capabilities = blink.get_lsp_capabilities(config.capabilities)
                    vim.lsp.config(server_name, config)
                    vim.lsp.enable(server_name)
                end
            }
        end,
    },
}
