return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c_sharp",
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = {
                "csharp_language_server"
            }
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    },
}

