-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ";"

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- -- Window splits
map("n", "<leader>h", ":wincmd h<CR>")
map("n", "<leader>j", ":wincmd j<CR>")
map("n", "<leader>k", ":wincmd k<CR>")
map("n", "<leader>l", ":wincmd l<CR>")
-- for i = 1, 9, 1 do
-- -- Move between windows by leader + window number
-- map("n", "<leader>d" .. i, ":" .. i .. "wincmd w<CR>")
-- end

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Open file tree (nvim-tree)
map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
map("n", "fn", ":NvimTreeFindFile<CR>", { noremap = true })

-- Terminal mappings
map("n", "<C-t>", ":Term<CR>", { noremap = true }) -- open

-- Tagbar
map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

-- BuffersLine
for i = 0, 9, 1 do
	-- Go to buffer by leader+number
	map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>")
end
map("n", "<leader>dd", ":Bdelete<CR>")
