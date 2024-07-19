return {
    {
        'rcarriga/nvim-notify',
        optional = true,
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss All Notifications",
            },
        },
    }
}
