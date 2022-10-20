-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ';'

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-----------------------------------------------------------
-- Moving text lines up/down
-----------------------------------------------------------
map('x', "<C-S-Up>", ":m-2<CR>gv=gv")
map('x', "<C-S-Down>", ":m'>+<CR>gv=gv")
map('n', "<C-S-Up>", ":<C-u>m-2<CR>==")
map('n', "<C-S-Down>", ":<C-u>m+<CR>==")

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Open file tree (nvim-tree)
map('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
map('n', 'fn', ':NvimTreeFindFile<CR>', { noremap = true })

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>') -- open/close

-- Bufferline
map('n', 'H', ':BufferLineCycleNext<CR>', { noremap = true })
map('n', 'L', ':BufferLineCyclePrev<CR>', { noremap = true })
map('n', '<leader>d', ':Bdelete<CR>', { noremap = true }) -- delete current buffer
map('n', '<leader>x', ':w<CR> | :Bwipeout<CR>', { noremap = true }) -- delete current buffer
