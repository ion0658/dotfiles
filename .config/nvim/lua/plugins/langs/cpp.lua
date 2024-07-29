local ensure_installed = {
    "clangd"
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c",
                "cpp"
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
        "p00f/clangd_extensions.nvim",
        event = {
            'BufReadPost *.c,*.cpp,*.h,*,hpp',
            'BufWritePost *.c,*.cpp,*.h,*,hpp',
            'BufNewFile *.c,*.cpp,*.h,*,hpp',
        },
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
