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

-- Clear search highlighting
map("n", "<space><space>", ":nohl<CR>", { desc = "Clear search highlighting" })

-- Reload configuration without restart nvim
-- map("n", "<leader>r", ":so %<CR>")

-- -- Window splits
map("n", "<leader>ww", "<C-w>w")
map("n", "<leader>wh", ":wincmd h<CR>", { desc = "Move to left window" })
map("n", "<leader>wj", ":wincmd j<CR>", { desc = "Move to down window" })
map("n", "<leader>wk", ":wincmd k<CR>", { desc = "Move to up window" })
map("n", "<leader>wl", ":wincmd l<CR>", { desc = "Move to right window" })

-- for i = 1, 9, 1 do
-- -- Move between windows by leader + window number
-- map("n", "<leader>d" .. i, ":" .. i .. "wincmd w<CR>")
-- end

-- Tabs
-- map("n", "<leader>tt", ":tabnew<CR>")
-- map("n", "<leader>tn", ":tabn<CR>")
-- map("n", "<leader>tp", ":tabp<CR>")

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
