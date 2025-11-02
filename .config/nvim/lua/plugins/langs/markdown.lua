return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "markdown",
                "markdown_inline",
            }
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "marksman" }
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            { "saghen/blink.cmp",            lazy = true },
            { "nvim-tree/nvim-web-devicons", lazy = true },
            { 'echasnovski/mini.icons',      lazy = true },
        },
    },
}

