return {
    {
        "toppair/peek.nvim",
        event = { 'BufReadPost *.md', 'BufWritePost *.md', 'BufNewFile *.md' },
        build = "deno task --quiet build:fast",
        config = function()
            require("peek").setup()
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end,
    },
}
