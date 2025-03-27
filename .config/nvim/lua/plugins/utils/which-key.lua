return {
    {
        "folke/which-key.nvim",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        opts = {
            spec = {
                { "<BS>",      desc = "Decrement Selection", mode = "x" },
                { "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
            },
        },
    },
}
