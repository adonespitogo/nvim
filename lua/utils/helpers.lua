local M = {}

-- Function to check if there's only one open buffer and the buffer is empty
function M.is_single_empty_buffer()
	-- Get the list of all buffers
	local buffers = vim.api.nvim_list_bufs()

	-- Filter out unlisted buffers
	buffers = vim.tbl_filter(function(buf)
		return vim.api.nvim_buf_get_option(buf, "buflisted")
	end, buffers)

	-- Check if there's only one buffer
	if #buffers ~= 1 then
		return false
	end

	-- Get the buffer ID
	local buf = buffers[1]

	-- Check if the buffer is loaded
	if not vim.api.nvim_buf_is_loaded(buf) then
		return false
	end

	-- Get the lines in the buffer
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	-- Check if the buffer is empty (i.e., contains only one empty line)
	if #lines == 1 and lines[1] == "" then
		return true
	end

	return false
end

-- Function to check if a file is already loaded in a buffer
function M.find_window_with_file(file_path)
	-- Get the list of all windows
	local windows = vim.api.nvim_list_wins()

	for _, win in ipairs(windows) do
		-- Get the buffer associated with the window
		local buf = vim.api.nvim_win_get_buf(win)
		-- Get the buffer's file name
		local buf_name = vim.api.nvim_buf_get_name(buf)
		-- Check if the buffer's file name matches the file path
		if buf_name == file_path then
			return win
		end
	end

	return nil
end

-- Function to find the file path by buffer number
function M.find_file_by_bufnr(bufnr)
	bufnr = bufnr or 0 -- 0 means current buffer
	if not vim.api.nvim_buf_is_loaded(bufnr) then
		return nil
	end
	local name = vim.api.nvim_buf_get_name(bufnr)
	if name == "" then
		return nil -- unsaved buffer, no name yet
	end
	return vim.fn.fnamemodify(name, ":p") -- expand to full absolute path
end

-- Custom function to handle opening files
function M.open_file(split, file_path)
	-- Check if the file is already loaded in a window
	local win = M.find_window_with_file(file_path)
	if win then
		-- Set focus to the window containing the file
		vim.api.nvim_set_current_win(win)

		-- Check if there's only one empty buffer
	elseif M.is_single_empty_buffer() then
		-- Edit the file in the current buffer
		vim.cmd("edit " .. file_path)
	else
		-- Open the file in a vertical/horizontal split
		if split == "vsplit" then
			vim.cmd(split .. " " .. file_path)
		else
			vim.cmd("wincmd p")
			vim.cmd(split .. " " .. file_path)
		end
	end
end

-- Toggle executable permission
function M.toggle_exec_perm(file_path)
	-- Get the current node in the nvim-tree
	local command = "test -x " .. file_path .. " && echo 'true' || echo 'false'"
	local handle = io.popen(command)
	if not handle then
		return false
	end

	local result = handle:read("*a"):gsub("%s+", "") -- Remove whitespace
	handle:close()
	local is_executable = result == "true"
	local is_file = M.is_file(file_path)

	if is_file then
		if is_executable then
			vim.fn.system("chmod -x " .. file_path)
			print(file_path .. " is now non-executable")
		else
			vim.fn.system("chmod +x " .. file_path)
			print(file_path .. " is now executable")
		end
	end
end

function M.is_file(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == "file"
end

return M
