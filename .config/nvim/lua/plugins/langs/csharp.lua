local ensure_installed = {
    "omnisharp",
}
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
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
}

