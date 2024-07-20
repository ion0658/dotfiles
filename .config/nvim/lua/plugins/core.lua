return {
    {
        "nvim-tree/nvim-web-devicons",
        optional = true,
        lazy = true
    },
    {
        "vhyrro/luarocks.nvim",
        priority = 100, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        config = true,
    }
}
