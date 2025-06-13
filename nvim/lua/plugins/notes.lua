return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			heading = {
				position = "inline",
			},
			indent = {
				enabled = false,
				skip_heading = true,
				icon = ""
			}
		}
	},
	{
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end
    }
}
