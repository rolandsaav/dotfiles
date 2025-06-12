return { 
	{
		"rolandsaav/UsefulLualineComponents"
	},
	{
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local testComponent = require("saav-useful")

		require('lualine').setup {
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = {
					testComponent.localMarks({ letters = "abcd" }),
					testComponent.globalMarks({ letters = "ABCD" })
				},
				lualine_y = { 'tabs' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
		}
	end
} 
}
