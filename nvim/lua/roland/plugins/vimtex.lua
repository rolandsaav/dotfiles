return {
	"lervag/vimtex",
	lazy = false,
	config = function ()
		vim.g.vimtex_method = 'sioyek'
		vim.cmd("syntax enable")

	end
}
