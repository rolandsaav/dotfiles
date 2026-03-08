return {
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts =
		{
			terminal_colors = true,
			contrast = "hard",
			transparent_mode = false,
		},
		init = function()
			-- vim.o.background = "dark" -- or "light" for light mode
			-- vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require('onedark').setup {
				style = 'darker',
				code_style = {
					comments = 'italic',
					keywords = 'none',
					functions = 'bold',
					strings = 'none',
					variables = 'bold'
				}
			}
			require('onedark').load()
		end
	}
}
