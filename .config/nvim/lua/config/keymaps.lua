local map = vim.keymap.set

local function keymap_opts(desc, noremap, silent)
    if noremap == nil then
        noremap = true
    end
    if silent == nil then
        silent = true
    end

    return { desc = desc, noremap = noremap, silent = silent }
end

-- JJ to normal mode
map("i", "jj", "<Esc>", keymap_opts("To Normal Mode"))

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", keymap_opts("Go to Left Window"))
map("n", "<C-j>", "<C-w>j", keymap_opts("Go to Lower Window"))
map("n", "<C-k>", "<C-w>k", keymap_opts("Go to Upper Window"))
map("n", "<C-l>", "<C-w>l", keymap_opts("Go to Right Window"))

local function delete_current_bufer()
    local buf = vim.api.nvim_get_current_buf() or 0
    if vim.bo.modified then
        local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
        if choice == 0 or choice == 3 then -- 0 for <Esc>/<C-c> and 3 for Cancel
            return
        end
        if choice == 1 then -- Yes
            vim.cmd.write()
        end
    end

    for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_win_call(win, function()
            if not vim.api.nvim_win_is_valid(win) or vim.api.nvim_win_get_buf(win) ~= buf then
                return
            end
            -- Try using alternate buffer
            local alt = vim.fn.bufnr("#")
            if alt ~= buf and vim.fn.buflisted(alt) == 1 then
                vim.api.nvim_win_set_buf(win, alt)
                return
            end

            -- Try using previous buffer
            local has_previous = pcall(vim.cmd, "bprevious")
            if has_previous and buf ~= vim.api.nvim_win_get_buf(win) then
                return
            end

            -- Create new listed buffer
            local new_buf = vim.api.nvim_create_buf(true, false)
            vim.api.nvim_win_set_buf(win, new_buf)
        end)
    end
    if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.cmd, "bdelete! " .. buf)
    end
end
-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", keymap_opts("Prev Buffer"))
map("n", "<S-l>", "<cmd>bnext<cr>", keymap_opts("Next Buffer"))
map("n", "[b", "<cmd>bprevious<cr>", keymap_opts("Prev Buffer"))
map("n", "]b", "<cmd>bnext<cr>", keymap_opts("Next Buffer"))
map("n", "<leader>bb", "<cmd>e #<cr>", keymap_opts("Switch to Other Buffer"))
map("n", "<leader>`", "<cmd>e #<cr>", keymap_opts("Switch to Other Buffer"))
map("n", "<leader>bd", delete_current_bufer, keymap_opts("Delete Buffer"))
map("n", "<leader>bD", "<cmd>:bd<cr>", keymap_opts("Delete Buffer and Window"))

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", keymap_opts("Escape and Clear hlsearch"))

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", keymap_opts("Save File"))

-- better indenting
map("v", "<", "<gv", keymap_opts("Indent Left"))
map("v", ">", ">gv", keymap_opts("Indent Right"))

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", keymap_opts("Add Comment Below"))
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", keymap_opts("Add Comment Above"))

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", keymap_opts("Lazy"))

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", keymap_opts("New File"))

map("n", "<leader>xl", "<cmd>lopen<cr>", keymap_opts("Location List"))
map("n", "<leader>xq", "<cmd>copen<cr>", keymap_opts("Quickfix List"))

map("n", "[q", vim.cmd.cprev, keymap_opts("Previous Quickfix"))
map("n", "]q", vim.cmd.cnext, keymap_opts("Next Quickfix"))

map({ "n", "v" }, "<leader>cf", function()
    vim.lsp.buf.format()
end, keymap_opts("Format"))

-- diagnostic
local diagnostic_goto = function(next, severity)
    local count = next and 1 or -1
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        vim.diagnostic.jump({ count = count, float = true, severity = severity })
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, keymap_opts("Line Diagnostics"))
map("n", "]d", diagnostic_goto(true), keymap_opts("Next Diagnostic"))
map("n", "[d", diagnostic_goto(false), keymap_opts("Prev Diagnostic"))
map("n", "]e", diagnostic_goto(true, "ERROR"), keymap_opts("Next Error"))
map("n", "[e", diagnostic_goto(false, "ERROR"), keymap_opts("Prev Error"))
map("n", "]w", diagnostic_goto(true, "WARN"), keymap_opts("Next Warning"))
map("n", "[w", diagnostic_goto(false, "WARN"), keymap_opts("Prev Warning"))

-- quit
map("n", "<leader>qq", "<cmd>quitall<cr>", keymap_opts("Quit All"))

-- Toggle Terminal
map("n", "<leader>ft", "<Cmd>ToggleTerm<CR>", keymap_opts("Terminal (Root Dir)"))
map("n", "<c-/>", "<Cmd>ToggleTerm<CR>", keymap_opts("Terminal (Root Dir)"))
map("n", "<c-_>", "<Cmd>ToggleTerm<CR>", keymap_opts("which_key_ignore"))

-- Terminal Mappings
map("t", "<C-h>", "<cmd>wincmd h<cr>", keymap_opts("Go to Left Window"))
map("t", "<C-j>", "<cmd>wincmd j<cr>", keymap_opts("Go to Lower Window"))
map("t", "<C-k>", "<cmd>wincmd k<cr>", keymap_opts("Go to Upper Window"))
map("t", "<C-l>", "<cmd>wincmd l<cr>", keymap_opts("Go to Right Window"))
map("t", "<C-/>", "<cmd>close<cr>", keymap_opts("Hide Terminal"))
map("t", "<c-_>", "<cmd>close<cr>", keymap_opts("which_key_ignore"))

-- windows
map("n", "<leader>w", "<c-w>", keymap_opts("Windows"))
map("n", "<leader>-", "<C-W>s", keymap_opts("Split Window Below"))
map("n", "<leader>|", "<C-W>v", keymap_opts("Split Window Right"))
map("n", "<c-w>d", "<C-W>c", keymap_opts("Delete Window"))

map("i", "<Tab>", function()
        if vim.fn.pumvisible() == 1 then
            return '<C-y>' -- メニューが出ていれば確定
        else
            return '<Tab>' -- 出ていなければ通常のTab
        end
    end,
    keymap_opts("accept complete"))

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = false }),
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end

        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        end

        -- フォーマット
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('UserLspConfig', { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 3000 })
                end,
            })
        end
    end
})
