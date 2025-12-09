return {
    {
        'neovim/nvim-lspconfig',
        version = false,
        lazy    = true,
        event   = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        keys    = {
            { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
        },
        opts    = function()
            local opts = {
                servers = {
                    lua_ls = {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                            },
                        },
                        filetypes = { "lua" },
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
                }
            }
            return opts
        end,
        config  = function(_, opts)
            for server, config in pairs(opts.servers) do
                vim.lsp.config(server, config)
            end
        end,
    },
}

