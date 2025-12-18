return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main"
		-- opts = {
		-- 	ensure_installed = { "c", "lua", "python", "vimdoc" },
		-- 	auto_install = true,
		-- 	highlight = {
		-- 		enable = true,
		-- 	},
		-- },
		-- config = function()
		-- 	treesitter = require("nvim-treesitter")
		-- 	treesitter.setup {
		-- 		ensure_installed = { "c", "lua", "python", "vimdoc" },
		-- 		auto_install = true,
		-- 		highlight = {
		-- 			enable = true,
		-- 		},
		-- 	}
		-- end
	},
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<A-o>",
					node_incremental = "<A-o>",
					scope_incremental = "<A-O>",
					node_decremental = "<A-i>",
				},
			},
		},

	}
}
