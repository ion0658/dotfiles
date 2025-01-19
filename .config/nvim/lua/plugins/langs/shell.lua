local ensure_installed = {
    "bashls",
    "lua_ls",
    "autotools_ls",
    "cmake",
    "vimls",
    "sqls"
}

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
    }
}

