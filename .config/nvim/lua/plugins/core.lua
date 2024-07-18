return {
    { "folke/lazy.nvim", version = false },
    { "LazyVim/LazyVim", version = false },
    {
        "camspiers/luarocks",
        dependencies = {
            "rcarriga/nvim-notify", -- Optional dependency
        },
        opts = {
            rocks = { "fzy" } -- Specify LuaRocks packages to install
        }
    }
}
