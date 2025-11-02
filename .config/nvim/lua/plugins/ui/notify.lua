return {
    {
        'rcarriga/nvim-notify',
        version = "*",
        lazy = true,
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss All Notifications",
            },
        },
        opts = {
            background_colour = "#000000",
        }
    }
}

