-- Function to check if there's only one open buffer and the buffer is empty
local function is_single_empty_buffer()
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
local function find_window_with_file(file_path)
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

-- Custom function to handle opening files
local function open_file(split)
	-- Get the current node in the nvim-tree
	local api = require("nvim-tree.api")
	local node = api.tree.get_node_under_cursor()

	if node and node.type == "file" then
		local file_path = node.absolute_path

		-- Check if the file is already loaded in a window
		local win = find_window_with_file(file_path)
		if win then
			-- Set focus to the window containing the file
			vim.api.nvim_set_current_win(win)

			-- Check if there's only one empty buffer
		elseif is_single_empty_buffer() then
			-- Edit the file in the current buffer
			vim.cmd("edit " .. node.absolute_path)
		else
			-- Open the file in a vertical/horizontal split
			if split == "vsplit" then
				vim.cmd(split .. " " .. node.absolute_path)
			else
				vim.cmd("wincmd p")
				vim.cmd(split .. " " .. node.absolute_path)
			end
		end
	else
		api.node.open.edit()
	end
end

-- Toggle executable permission
local function toggle_executable_perm()
	-- Get the current node in the nvim-tree
	local api = require("nvim-tree.api")
	local node = api.tree.get_node_under_cursor()

	local function is_executable(file_path)
		local command = "test -x " .. file_path .. " && echo 'true' || echo 'false'"
		local handle = io.popen(command)
        if not handle then
            return false
        end

		local result = handle:read("*a"):gsub("%s+", "") -- Remove whitespace
		handle:close()
		return result == "true"
	end

	if node and node.type == "file" then
		local file_path = node.absolute_path
		local cmd = "chmod +x " .. file_path
		if is_executable(file_path) then
			cmd = "chmod -x " .. file_path
		end
		vim.fn.system(cmd)
	end
end

local function open_file_vert()
	open_file("vsplit")
end

local function open_file_horz()
	open_file("split")
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local map = require("utils.keymap")
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- Default mappings. Feel free to modify or remove as you wish.
			--
			-- BEGIN_DEFAULT_ON_ATTACH
			vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
			vim.keymap.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
			vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
			vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
			vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
			-- vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
			-- vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "<C-v>", open_file_vert, opts("Open: Vertical Split"))
			vim.keymap.set("n", "<C-x>", open_file_horz, opts("Open: Horizontal Split"))
			vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
			vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
			vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
			vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
			vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
			vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "a", api.fs.create, opts("Create"))
			vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
			vim.keymap.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle No Buffer"))
			vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
			vim.keymap.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Git Clean"))
			vim.keymap.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
			vim.keymap.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
			vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))

			vim.keymap.set("n", "D", api.fs.trash, opts("Trash"))
			vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
			vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
			vim.keymap.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
			vim.keymap.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
			vim.keymap.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
			vim.keymap.set("n", "f", api.live_filter.start, opts("Filter"))
			vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
			vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
			vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
			vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
			vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
			vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
			vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
			vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
			vim.keymap.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
			vim.keymap.set("n", "q", api.tree.close, opts("Close"))
			vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
			vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
			vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
			vim.keymap.set("n", "S", api.tree.search_node, opts("Search"))
			vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
			vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
			vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
			vim.keymap.set("n", "X", toggle_executable_perm, opts("Make file executable"))
			vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
			vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
			vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
			vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
			-- END_DEFAULT_ON_ATTACH

			-- Mappings migrated from view.mappings.list
			--
			-- You will need to insert "your code goes here" for any mappings with a custom action_cb
			vim.keymap.set("n", "H", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "L", api.tree.change_root_to_node, opts("CD"))
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			reload_on_bufenter = true,
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 1000,
			},
			view = {
				width = 30,
				adaptive_size = true,
				-- mappings = {
				-- list = {
				-- { key = "H", action = "dir_up" },
				-- { key = "L", action = "cd" },
				-- },
				-- },
			},
			filters = {
				dotfiles = false,
				custom = { "^.git$", ".DS_Store" },
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {
					".git",
					"/.ccls-cache",
					"/node_modules",
					"assets/dist/*",
					"*_templ.go",
				},
			},
		})

		-- Open file tree (nvim-tree)
		map("n", "<leader>e", ":NvimTreeToggle<CR>")
		map("n", "<leader>fn", ":NvimTreeFindFile<CR>", { desc = "Show file location in nvim-tree" })
	end,
}
