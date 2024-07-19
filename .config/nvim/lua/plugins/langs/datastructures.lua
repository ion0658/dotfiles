local ensure_installed = {
    -- docker
    "dockerls",
    "docker_compose_language_service",
    -- markdown
    "marksman",
    -- yaml
    "yamlls",
    -- toml
    "taplo"
}


return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local ensure_installed = {
                -- data structures
                "jsdoc",
                "json",
                "jsonc",
                "toml",
                "xml",
                "yaml",
                "dockerfile"
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
