return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local function hello()
			return [[hello world]]
		end
		local markNames = "ABCD"
		-- Component needs to refresh when marks are set

		function localMarks()
			local localMarkNames = markNames:lower()
			local status = "Lm:"
			local curBuf = vim.api.nvim_get_current_buf()

			for i = 1, localMarkNames:len() do
				local mark = localMarkNames:sub(i, i)
				local location = vim.api.nvim_buf_get_mark(curBuf, mark)
				if location[1] == 0 and location[2] == 0 then
					goto continue
				end

				status = status .. " " .. mark
				::continue::
			end

			return status
		end

		function globalMarks()
			local status = "GM:"

			for i = 1, markNames:len() do
				local mark = markNames:sub(i, i)
				local location = vim.api.nvim_get_mark(mark, {})
				local line, col, bufnr, file = unpack(location)
				if line == 0 and col == 0 and bufnr == 0 and file == "" then
					goto continue
				end

				status = status .. " " .. mark
				::continue::
			end

			return status
		end

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				}
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { 'filename' },
				lualine_x = { globalMarks, localMarks },
				lualine_y = { 'tabs' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}
	end
}
