return function()
	-- Get a list of all buffers
	local buffers = vim.api.nvim_list_bufs()

	-- Iterate over each buffer
	for _, bufnr in ipairs(buffers) do
		-- Check if the buffer is empty and doesn't have a name
		if
			vim.api.nvim_buf_is_loaded(bufnr)
			and vim.api.nvim_buf_get_name(bufnr) == ""
			and vim.api.nvim_buf_get_option(bufnr, "buftype") == ""
		then
			-- Get all lines in the buffer
			local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

			-- Initialize a variable to store the total number of characters
			local total_characters = 0

			-- Iterate over each line and calculate the number of characters
			for _, line in ipairs(lines) do
				total_characters = total_characters + #line
			end

			-- Close the buffer if it's empty:
			if total_characters == 0 then
				vim.api.nvim_buf_delete(bufnr, {
					force = true,
				})
			end
		end
	end
end
