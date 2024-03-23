return {
	{
		"williamboman/mason.nvim",
		config = true,
		lazy = false
	},
    {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		config = function()
			local cmp = require 'cmp'
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users
						-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For ultisnips users.
				}, {
					{ name = 'buffer' },
				})
			})
		end,
	},
    {
        "hrsh7th/cmp-nvim-lsp",
        lazy = false,
    },
	{
		'williamboman/mason-lspconfig.nvim',
		lazy = false,
		config = function()
			require("mason-lspconfig").setup()
            require("neodev").setup()

            local capabilities = require('cmp_nvim_lsp').default_capabilities()


			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
				end,
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false
	}
}
