return {
    { "onsails/lspkind.nvim", lazy = true },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", lazy = true },
            { "hrsh7th/cmp-buffer",   lazy = true },
            { "hrsh7th/cmp-path",     lazy = true },
        },
        opts = {
            sources = {
                { name = "nvim_lsp", group_index = 1, priority = 100 },
                { name = "path",     group_index = 2, priority = 80 },
                { name = "buffer",   group_index = 1, priority = 90 },
            },
            extends = { 'cmp-nvim-lsp' }
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
