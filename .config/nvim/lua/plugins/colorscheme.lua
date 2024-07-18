return {
	{
		"cocopon/iceberg.vim",
		enabled = false,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = { style = "night" },
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
		enabled = true,
		opts = {
			flavour = "mocha",
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
