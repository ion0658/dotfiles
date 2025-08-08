return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "comment",
                "make",
                "lua",
                "luadoc",
                "luap",
                "regex",
                "sql",
                "vim",
                "vimdoc",
            }
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "bashls",
                "lua_ls",
                "autotools_ls",
                "vimls",
            }
        },
    },
    {
        "jay-babu/mason-null-ls.nvim",
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
    }
}
