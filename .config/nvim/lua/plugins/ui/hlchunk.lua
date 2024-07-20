return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = {
                    enable = true
                },
                indent = {
                    enable = true
                },
                blank = {
                    enable = true
                },
                line_num = {
                    enable = true
                },
            })
        end
    },
}
