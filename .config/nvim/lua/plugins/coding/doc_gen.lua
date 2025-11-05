return {
    {
        "kkoomen/vim-doge",
        enabled = true,
        version = "*",
        lazy    = true,
        event   = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts    = {
            doge_doc_standard_cpp = 'doxygen_cpp_comment_slash',
            doge_doc_standard_c = 'doxygen_cpp_comment_slash',
        },
        keys    = {
            { "<leader>td", "<cmd>DogeGenerate<cr>", desc = "Generate Documentation" },
        },
        init    = function()
            vim.g.doge_mapping = 0
            vim.g.doge_enable_mappings = 0
            vim.g.doge_buffer_mappings = 0
            vim.g.doge_mapping_comment_jump_forward = 0
            vim.g.doge_mapping_comment_jump_backward = 0
        end,
        config  = function(_, opts)
            vim.g.doge_doc_standard_cpp = opts.doge_doc_standard_cpp
            vim.g.doge_doc_standard_c = opts.doge_doc_standard_c
        end,
    }
}

