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
            local mason_packages = vim.fn.stdpath("data") .. "/mason/packages";
            local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
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
                    },
                    vue_ls = {
                        filetypes = { "vue" },
                        init_options = {
                            vue = {
                                hybridMode = false
                            },
                        }
                    },
                    ts_ls = {
                        init_options = {
                            plugins = {
                                {
                                    name = "@vue/typescript-plugin",
                                    location = volar_path,
                                    languages = { "vue" },
                                },
                            },
                        },
                        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
                    }
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
