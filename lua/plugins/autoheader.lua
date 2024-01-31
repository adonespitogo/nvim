return {
    "alpertuna/vim-header",
    config = function()
        local map = require("utils.keymap")
        map("n", "<F4>", ":AddHeader<CR>", { desc = "Add author header to file" })
    end,
} -- Add author header to file
