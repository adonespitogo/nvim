local map = require("utils.keymap")

return {
    "mfussenegger/nvim-dap",
    config = function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)

        map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>")
        map("n", "<leader>dc", ":lua require('dap').continue()<CR>")
        map("n", "<leader>du", function()
            sidebar.open()
        end)

        map("n", "<leader>dx", function()
            sidebar.close()
        end)
    end,
}
