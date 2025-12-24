return {
    {
        'neovim/nvim-lspconfig',
        version = false,
        lazy    = true,
        event   = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        keys    = {
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        },
        opts    = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { 'vim' },
                            },
                        },
                    },
                },
                clangd = {
                    capabilities = {
                        offsetEncoding = { 'utf-16', 'utf-8' },
                        textDocument = {
                            semanticTokens = {
                                multilineTokenSupport = true,
                            },
                        },
                    },
                    init_options = {
                        fallbackFlags = { "-std=c++20" },
                    },
                    cmd = { "clangd", "--background-index", "--clang-tidy" },
                },
                rust_analyzer = {
                    settings = {
                        ["rust-analyzer"] = {
                            cargo = {
                                targetDir = "target/rust-analyzer",
                            }
                        },
                        checkOnSave = {
                            command = "clippy"
                        },
                    }
                },
            },
        },
        config  = function(_, opts)
            local lspconfig = require('lspconfig')
            for server, config in pairs(opts.servers) do
                local default_config = lspconfig.util.default_config[server] or {}
                default_config = vim.tbl_deep_extend("force", default_config, config)
                vim.lsp.config(server, default_config)
            end
        end,
    },
}

