return {
    {
        "zbirenbaum/copilot.lua",
        version = false,
        lazy = true,
        cmd = "Copilot",
        build = ":Copilot auth",
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
        "zbirenbaum/copilot-cmp",
        version = false,
        lazy = true,
        dependencies = {
            { "zbirenbaum/copilot.lua", lazy = true },
        },
        event = { "InsertEnter" },
        opts = {}
    },
}

