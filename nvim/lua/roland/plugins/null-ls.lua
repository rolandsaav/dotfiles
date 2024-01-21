return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null.setup({
			sources = {
				null.builtins.formatting.prettier
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
							-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
							-- vim.lsp.buf.format({
							-- 	filter = function(_client) return _client.name ~= "tsserver" end
							-- })
							vim.lsp.buf.format({async = false})
						end,
					})
				end
			end,
		})
	end
}
