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
            { 'saghen/blink.cmp',     lazy = true },
        },
        opts_extend  = { "ensure_installed" },
        opts         = {
            ensure_installed = {},
        },
        config       = function(_, opts)
            local p = require("mason-lspconfig")
            p.setup(opts)
            p.setup_handlers {
                function(server_name)
                    local server_config = {}

                    if server_name == "volar" then
                        server_config = {
                            filetypes = { "vue" },
                            init_options = {
                                vue = {
                                    hybridMode = false
                                },
                            }
                        }
                    end
                    if server_name == "ts_ls" then
                        local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
                        local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"
                        server_config = {
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
                    end
                    if server_name == "rust_analyzer" then
                        server_config = {
                            cachePriming = {
                                enable = false
                            }

                        }
                    end
                    if server_name == "lua_ls" then
                        server_config = {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        }
                    end
                    server_config.capabilities = require('blink.cmp').get_lsp_capabilities(server_config.capabilities)
                    require("lspconfig")[server_name].setup(server_config)
                end
            }
        end,
    },
}
