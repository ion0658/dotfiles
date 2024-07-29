local ensure_installed = {
    -- markdown
    "marksman",
}


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
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = ensure_installed
        },
    },
    {
        "toppair/peek.nvim",
        event = { 'BufReadPost *.md', 'BufWritePost *.md', 'BufNewFile *.md' },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
