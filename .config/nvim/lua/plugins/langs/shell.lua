local ensure_installed = {
    "bashls",
    "lua_ls",
    "autotools_ls",
    "cmake",
    "vimls",
    "sqls",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local ensure_installed = {
                -- shell/vim
                "bash",
                "comment",
                "make",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "regex",
                "sql",
                "vim",
                "vimdoc",
            }
            for _, lang in pairs(ensure_installed) do
                table.insert(opts.ensure_installed, lang)
            end
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = function(_, opts)
            for _, lang in pairs(ensure_installed) do
                table.insert(opts.ensure_installed, lang)
            end
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        opts = function(_, opts)
            for _, lang in pairs(ensure_installed) do
                table.insert(opts.ensure_installed, lang)
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = function(_, opts)
            for _, lang in pairs(ensure_installed) do
                table.insert(opts.ensure_installed, lang)
            end
        end,
    }
}
