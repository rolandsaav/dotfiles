return {
	"nvim-treesitter/nvim-treesitter",
	config = function() 
		require("nvim-treesitter.configs").setup {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			ensure_installed = { "javascript", "java", "lua", "cpp", "rust", "python" },
			auto_install = true,
			sync_install = false,
			modules = {},
			ignore_install = { "" }
		}
	end
}
