return {
    "eandrju/cellular-automaton.nvim",
    init = function()
        local map = require("utils.keymap")
        map("n", "<F5>", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Cool code animation" })
    end,
}
