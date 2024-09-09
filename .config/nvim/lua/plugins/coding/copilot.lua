return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        lazy = true,
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
                gitcommit = true,
            },
        },
    },
    {
        "nvim-cmp",
        dependencies = {
            {
                "zbirenbaum/copilot-cmp",
                -- dependencies = { "copilot.lua", lazy = true },
                lazy = true,
            },
        },
        opts = function(_, otps)
            table.insert(otps.sources, { name = "copilot", group_index = 2, priority = 50 })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        -- dependencies = { "copilot.lua", "onsails/lspkind.nvim" },
        event = { "InsertEnter" },
    },
}
