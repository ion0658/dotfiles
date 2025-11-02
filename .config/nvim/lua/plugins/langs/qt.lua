return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
            }
        }
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "qmlls"
            }
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    },
}

