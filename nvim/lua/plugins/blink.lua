return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",
			['<CR>'] = { 'accept', 'fallback' },
		},
		completion = {
			menu = {
				border = "rounded",
				winhighlight =
				"Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
			},
			documentation = {
				window = { border = "rounded" },
			},
			accept = {
				auto_brackets = {
					enabled = true
				}
			}
		},
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
	},
}
