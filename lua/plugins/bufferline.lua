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

		-- Set the highlight groups for bufferline to have a transparent background
		vim.cmd([[
          highlight BufferLineFill guibg=none
          highlight BufferLineBackground guibg=none
          highlight BufferLineBufferVisible guibg=none
          highlight BufferLineBufferSelected guibg=none
          highlight BufferLineTab guibg=none
          highlight BufferLineTabSelected guibg=none
          highlight BufferLineTabClose guibg=none
          highlight BufferLineDuplicate guibg=none
          highlight BufferLineDuplicateSelected guibg=none
          highlight BufferLineDuplicateVisible guibg=none
          highlight BufferLineModified guibg=none
          highlight BufferLineModifiedSelected guibg=none
          highlight BufferLineModifiedVisible guibg=none
          highlight BufferLineSeparator guibg=none
          highlight BufferLineSeparatorSelected guibg=none
          highlight BufferLineSeparatorVisible guibg=none
          highlight BufferLineIndicatorSelected guibg=none
        ]])
	end,
}
