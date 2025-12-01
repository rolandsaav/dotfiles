return {
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = 
	{
		terminal_colors = true,
		contrast = "hard",
		transparent_mode = false,
	},
	init = function ()
		vim.o.background = "dark" -- or "light" for light mode
		vim.cmd([[colorscheme gruvbox]])
	end,
	
}
}
