-----------------------------------------------------------
-- Define keymaps of Neovim.
-----------------------------------------------------------

local map = require("utils.keymap")

-- Change leader to a comma
vim.g.mapleader = ";"

-- LspRestart
map("n", "<leader>r", ":LspRestart<CR>", { desc = "Restart LSP" })

-- Map zero to ^
map("n", "0", "^")

-- Close buffer and window
map("n", "<leader>qq", ":bd<CR>", { desc = "Close buffer and window" })

-- Clear search highlighting
map("n", "<space><space>", ":nohl<CR>", { desc = "Clear search highlighting" })

-- Reload configuration without restart nvim
-- map("n", "<leader>r", ":so %<CR>")

-- -- Window splits
map("n", "<leader>ww", "<C-w>w")
map("n", "<leader>wh", ":wincmd h<CR>", { desc = "Jump to left window" })
map("n", "<leader>wj", ":wincmd j<CR>", { desc = "Jump to down window" })
map("n", "<leader>wk", ":wincmd k<CR>", { desc = "Jump to up window" })
map("n", "<leader>wl", ":wincmd l<CR>", { desc = "Jump to right window" })

for i = 1, 9, 1 do
	-- Move between windows by leader + window number
	map("n", "<leader>" .. i, ":" .. i .. "wincmd w<CR>")
end

-- Tabs
map("n", "<leader>tt", ":tabnew<CR>")
map("n", "<leader>tn", ":tabn<CR>")
map("n", "<leader>tp", ":tabp<CR>")

-- Copy+paste from/to system clip board
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>p", '"+p')
map("n", "<leader>P", '"+P')
map("v", "<leader>p", '"+p')
map("v", "<leader>P", '"+P')

-- Paste without yanking in visual mode
map("x", "p", "P")

-- Close all buffers
map("n", "<leader>bd", ":%bd<CR>", { desc = "Close buffer" })
