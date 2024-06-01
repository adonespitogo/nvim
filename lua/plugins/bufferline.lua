local map = require("utils.keymap")

return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "kyazdani42/nvim-web-devicons",
    },
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                numbers = "ordinal",
                -- offsets = {
                --     {
                --         filetype = "NvimTree",
                --         text = "File Explorer",
                --         text_align = "left",
                --         separator = true,
                --     },
                -- },
            },
        })

        -- map("n", "<leader>h", ":BufferLineCyclePrev<CR>")
        -- map("n", "<leader>l", ":BufferLineCycleNext<CR>")
        for i = 0, 9, 1 do
            -- Go to buffer by leader+number
            map("n", "<leader>b" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>")
        end
        -- map("n", "<leader>qq", ":Bdelete<CR>")

        vim.cmd([[
            hi BufferLineFill guibg='transparent'
            " hi BufferLineSeparator guibg='#191724'
            " hi BufferLineSeparatorVisible guibg='#191724'
            " set termguicolors
        ]])
    end,
}
