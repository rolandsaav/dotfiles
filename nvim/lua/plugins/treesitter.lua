return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
	},
	{
		"MeanderingProgrammer/treesitter-modules.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesitter-modules").setup {
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<A-o>",
						node_incremental = "<A-o>",
						scope_incremental = "<A-O>",
						node_decremental = "<A-i>",
					},
				},
				highlight = {
					enable = true,
					disable = false,
					-- setting this to true will run `:h syntax` and tree-sitter at the same time
					-- set this to `true` if you depend on 'syntax' being enabled
					-- using this option may slow down your editor, and duplicate highlights
					-- instead of `true` it can also be a list of languages
					additional_vim_regex_highlighting = false,
				}
			}
		end
	}
}
