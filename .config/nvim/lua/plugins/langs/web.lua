local ensure_installed = {
    -- web
    "html",
    "cssls",
    "biome",
    "volar",
    "tsserver",
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local ensure_installed = {
                -- web
                "html",
                "css",
                "javascript",
                "tsx",
                "typescript",
                "vue",
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
