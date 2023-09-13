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

-- LspRestart
map("n", "<leader>r", ":LspRestart<CR>")

-- Map zero to ^
map("n", "0", "^")

-- Clear search highlighting with <leader> and c
map("n", "<space><space>", ":nohl<CR>")

-- Reload configuration without restart nvim
-- map("n", "<leader>r", ":so %<CR>")

-- -- Window splits
map("n", "<leader>ww", "<C-w>w")
map("n", "<leader>wh", ":wincmd h<CR>")
map("n", "<leader>wj", ":wincmd j<CR>")
map("n", "<leader>wk", ":wincmd k<CR>")
map("n", "<leader>wl", ":wincmd l<CR>")
-- for i = 1, 9, 1 do
-- -- Move between windows by leader + window number
-- map("n", "<leader>d" .. i, ":" .. i .. "wincmd w<CR>")
-- end

-- Tabs
-- map("n", "<leader>tt", ":tabnew<CR>")
-- map("n", "<leader>tn", ":tabn<CR>")
-- map("n", "<leader>tp", ":tabp<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Open file tree (nvim-tree)
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "fn", ":NvimTreeFindFile<CR>")

-- Terminal mappings
-- map("n", "<C-t>", ":Term<CR>") -- open

-- Author Header
map("n", "<F4>", ":AddHeader<CR>")

-- Tagbar
map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

-- BuffersLine
map("n", "<leader>h", ":BufferLineCyclePrev<CR>")
map("n", "<leader>l", ":BufferLineCycleNext<CR>")
for i = 0, 9, 1 do
	-- Go to buffer by leader+number
	map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>")
end
map("n", "<leader>qq", ":Bdelete<CR>")

-- Nerd Commenter
map("n", "<leader>cc", "<Plug>NERDCommenterToggle")
map("x", "<leader>cc", "<Plug>NERDCommenterToggle")

-- Neogen
map("n", "<F2>", ":lua require('neogen').generate()<CR>")

-- Copy+paste from/to system clip board
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')
