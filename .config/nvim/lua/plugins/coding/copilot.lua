return {
    {
        "zbirenbaum/copilot.lua",
        version = "*",
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
            copilot_model = "gpt-4o-copilot"
        },
    },
    {
        "zbirenbaum/copilot-cmp",
        version = "*",
        lazy = true,
        dependencies = {
            { "zbirenbaum/copilot.lua", lazy = true },
        },
        event = { "InsertEnter" },
        opts = {}
    },
}
