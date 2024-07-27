local ensure_installed = {
    "omnisharp",
}
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local ensure_installed = {
                "c_sharp"
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
    },
}
