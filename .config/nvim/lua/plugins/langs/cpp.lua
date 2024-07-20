local ensure_installed = {
    "clangd"
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            local ensure_installed = {
                "c",
                "cpp"
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
    {
        "p00f/clangd_extensions.nvim",
        event = {
            'BufReadPost *.c', 'BufWritePost *.c', 'BufNewFile *.c',
            'BufReadPost *.cpp', 'BufWritePost *.cpp', 'BufNewFile *.cpp',
            'BufReadPost *.h', 'BufWritePost *.h', 'BufNewFile *.h',
            'BufReadPost *.hpp', 'BufWritePost *.hpp', 'BufNewFile *.hpp'
        },
        lazy = true,
        config = function() end,
        opts = {
            inlay_hints = {
                inline = false,
            },
            ast = {
                --These require codicons (https://github.com/microsoft/vscode-codicons)
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },
                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                },
            },
        },
    },
}
