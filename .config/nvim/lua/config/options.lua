vim.opt.number = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.splitright = true
vim.opt.encoding = "utf-8"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.wrapscan = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.termguicolors = true

if vim.env.PYENV_ROOT then
    vim.g.python3_host_prog = vim.env.PYENV_ROOT .. '/versions/neovim3/bin/python'
end
-- disable perl provider
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
--if vim.fn.executable("volta") then
--	vim.g.node_host_prog = vim.fn.trim(vim.fn.system("volta which neovim-node-host"))
--end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
})
vim.diagnostic.config {
    float = { border = "rounded" },
}

-- Cursor Position Restore on File Open
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec2('silent! normal! g`"zv', { output = false })
    end,
})

-- format on save with LSP
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- windowの20%をscrolloffに設定
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "WinEnter" }, {
    group = vim.api.nvim_create_augroup("UserNvimConfig", {}),
    callback = function()
        vim.opt.scrolloff = math.floor(vim.o.lines * 0.2)
    end,
})

