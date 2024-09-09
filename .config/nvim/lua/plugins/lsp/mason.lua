return {
    {
        "williamboman/mason.nvim",
        version = false,
        lazy = true,
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        config = true
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version     = false,
        event       = { "VeryLazy", 'BufReadPre', 'BufWritePre', 'BufNewFile' },
        opts_extend = { "ensure_installed" },
        opts        = {
            ensure_installed = {},
        },
        config      = function(_, opts)
            local p = require("mason-lspconfig")
            p.setup(opts)
            p.setup_handlers {
                function(server_name)
                    local server_config = {}
                    local tsdk = function()
                        return vim.fn.getcwd() .. "/node_modules/typescript/lib"
                    end

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
                    if server_name == "tsserver" then
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
                    require("lspconfig")[server_name].setup(server_config)
                end
            }
        end,
    },
}
