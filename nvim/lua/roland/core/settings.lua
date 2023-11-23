local opt = vim.o
opt.number = true
opt.cmdheight = 0
opt.rnu = true

opt.shiftwidth = 4
opt.smarttab = true
opt.tabstop = 4


opt.hlsearch = false
opt.incsearch = true

opt.swapfile = false

vim.diagnostic.config({
	virtual_text = false,
	underline = {
		severity = {
			min = vim.diagnostic.severity.HINT,
			max = vim.diagnostic.severity.ERROR
		}
	}
})
