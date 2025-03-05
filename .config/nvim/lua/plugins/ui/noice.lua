return {
    {
        "folke/noice.nvim",
        version = false,
        lazy = true,
        enabled = true,
        event = "VeryLazy",
        opts = {
            lsp = {
                signature = {
                    enabled = false,
                },
            },
        },
        keys = {
            { "<leader>sn",  "",                                                            desc = "+noice" },
            { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",                              desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end,                   desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end,                desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end,                    desc = "Noice All" },
            { "<leader>snd", function() require("noice").cmd("dismiss") end,                desc = "Dismiss All" },
            { "<leader>snt", function() require("noice").cmd("pick") end,                   desc = "Noice Picker (Telescope/FzfLua)" },
        },
    },

}
