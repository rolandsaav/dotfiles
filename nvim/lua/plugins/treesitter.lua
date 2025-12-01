return {
	"nvim-treesitter/nvim-treesitter", 
	branch = 'master', 
	lazy = false, 
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "lua", "python", "vimdoc" },
		auto_install = true,
		highlight = {
			enable = true,
		},
	}
}
