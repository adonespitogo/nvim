local map = require("utils.keymap")

map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

return { "preservim/tagbar" }
