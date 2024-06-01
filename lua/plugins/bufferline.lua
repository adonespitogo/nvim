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
                highlights = {
                    fill = {
                        bg = {
                            attribute = "bg",
                            highlight = "Pmenu",
                        },
                    },
                },
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
            map("n", "<leader>bv" .. i, ":vsplit<CR>:BufferLineGoToBuffer" .. i .. "<CR>")
            map("n", "<leader>bh" .. i, ":split<CR>:BufferLineGoToBuffer" .. i .. "<CR>")
        end
    end,
}
