return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				dim_inactive = false,
				transparent_mode = true
			})
		end
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"tanvirtin/monokai.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('monokai').setup { palette = require('monokai').pro }
		end
	}
}
