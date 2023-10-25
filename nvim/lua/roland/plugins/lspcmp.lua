return {
	{ "folke/neodev.nvim", opts = {} },
	{
		"williamboman/mason.nvim",
		config = true
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = { "lua_ls", "cssls", "jsonls", "tsserver", "jdtls", "pyright"}
		})
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			require("mason-lspconfig").setup_handlers {
				function (server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {capabilities = capabilities}
				end,
			}

			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
			  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			  callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
				  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', '<space>f', function()
				  vim.lsp.buf.format { async = true }
				end, opts)
			  end,
			})
		end,
		dependencies = {
			"neovim/nvim-lspconfig"
		}
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
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
		},
		config = function()
			local cmp = require'cmp'
			cmp.setup({
				mapping = cmp.mapping.preset.insert({
				  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
				  ['<C-f>'] = cmp.mapping.scroll_docs(4),
				  ['<C-Space>'] = cmp.mapping.complete(),
				  ['<C-e>'] = cmp.mapping.abort(),
				  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
				  { name = 'nvim_lsp' },
				  { name = 'luasnip' }, -- For luasnip users.
				  { name = 'buffer' },
				  { name = 'path' },
				}),
				snippet = {
				  -- REQUIRED - you must specify a snippet engine
				  expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				  end,
				},
			})
		end,
	}

}
