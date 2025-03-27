return {
    {
        'neovim/nvim-lspconfig',
        version      = "*",
        lazy         = true,
        dependencies = { 'saghen/blink.cmp', lazy = true },
        event        = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        keys         = {
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        },
        opts         = {
            servers = {
                rust_analyzer = {
                    cachePriming = {
                        enable = false
                    }
                }
            }
        },
        config       = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
                lspconfig[server].setup(config)
            end
        end
    },
}
