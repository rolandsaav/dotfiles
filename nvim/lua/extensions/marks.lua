local M = {}
local markNames = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
local localMarkNames = markNames:lower()

function M.localMarks(config)
	local prefix = "Lm:"
	if config["prefix"] then
		prefix = config["prefix"]
	end

	local marks = localMarkNames
	if config["letters"] then
		marks = config["letters"]
	end

	local delimiter = " "
	if config["delimiter"] then
		delimiter = config["delimiter"]
	end

	return function()
		local status = prefix

		local curBuf = vim.api.nvim_get_current_buf()

		for i = 1, marks:len() do
			local mark = marks:sub(i, i)
			local location = vim.api.nvim_buf_get_mark(curBuf, mark)
			if location[1] == 0 and location[2] == 0 then
				goto continue
			end

			status = status .. delimiter .. mark

			::continue::
		end

		return status
	end
end

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

return M
