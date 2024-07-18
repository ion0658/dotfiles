return {
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function()
			require("neoscroll").setup({
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>" },
			})
		end,
	},
	{
		"stevearc/aerial.nvim",
		event = "LazyFile",
		opts = function()
			local icons = vim.deepcopy(LazyVim.config.icons.kinds)

			-- HACK: fix lua's weird choice for `Package` for control
			-- structures like if/else/for/etc.
			icons.lua = { Package = icons.Control }

			---@type table<string, string[]>|false
			local filter_kind = false
			if LazyVim.config.kind_filter then
				filter_kind = assert(vim.deepcopy(LazyVim.config.kind_filter))
				filter_kind._ = filter_kind.default
				filter_kind.default = nil
			end

			local opts = {
				attach_mode = "global",
				backends = { "lsp", "treesitter", "markdown", "man" },
				show_guides = true,
				layout = {
					resize_to_content = false,
					win_opts = {
						winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
						signcolumn = "yes",
						statuscolumn = " ",
					},
				},
				icons = icons,
				filter_kind = filter_kind,
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
			}
			return opts
		end,
		keys = {
			{ "<leader>cs", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"stevearc/aerial.nvim",
		},
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = function()
			local icons = LazyVim.config.icons
			vim.o.laststatus = vim.g.lualine_laststatus
			local opts = {
				extensions = { "aerial", "neo-tree", "lazy" },
				options = {
					theme = "auto",
					disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "branch" },
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{ "filename" },
						{ "aerial" },
					},
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
					},

					--------------

					lualine_x = {
						{ "encoding" },
						{ "fileformat" },
					},
					lualine_y = {
						{
							function()
								return "  " .. require("dap").status()
							end,
							cond = function()
								return package.loaded["dap"] and require("dap").status() ~= ""
							end,
							color = function()
								return LazyVim.ui.fg("Debug")
							end,
						},
						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end,
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = function()
								return LazyVim.ui.fg("Special")
							end,
						},
						{ "location" },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				inactive_sections = {
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
			}
			return opts
		end,
	},
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<BS>", desc = "Decrement Selection", mode = "x" },
				{ "<c-space>", desc = "Increment Selection", mode = { "x", "n" } },
			},
		},
	},
}
