return {
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/vaults/brain",
				}
			},
			notes_subdir = "Rough",
			new_notes_location = "notes_subdir",
			templates = {
				folder = "Templates",
			},
			ui = {
				enable = false
			}
		}
	},
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
