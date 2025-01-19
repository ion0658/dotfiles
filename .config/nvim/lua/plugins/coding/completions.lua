return {
    {
        "onsails/lspkind.nvim",
        version = false,
        lazy = true,
    },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        version = false,
        lazy = true,
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp",   lazy = true },
            { "hrsh7th/cmp-buffer",     lazy = true },
            { "hrsh7th/cmp-path",       lazy = true },
            { "zbirenbaum/copilot-cmp", lazy = true, },
        },
        opts_extend = { "sources" },
        opts = {
            sources = {
                { name = "nvim_lsp", group_index = 1, priority = 100 },
                { name = "path",     group_index = 2, priority = 80 },
                { name = "buffer",   group_index = 1, priority = 90 },
                { name = "copilot",  group_index = 2, priority = 50 }
            },
        },
        config = function(_, opts)
            local cmp = require("cmp")
            local lspkind = require("lspkind")
            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({}),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<TAB>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                }),
                sources = cmp.config.sources(opts.sources),
            })
            vim.cmd([[
                    set completeopt=menuone,noinsert,noselect
                    highlight! default link CmpItemKind CmpItemMenuDefault
            ]])
        end,

    }
}

