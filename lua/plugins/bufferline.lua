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
			},
		})

		map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", { desc = "Cycle previous buffer" })
		map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Cycle previous buffer" })
		map("n", "<leader>bl", ":BufferLineCycleNext<CR>", { desc = "Cycle next buffer" })
		map("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Cycle next buffer" })

		for i = 0, 9, 1 do
			-- Go to buffer by leader+number
			map("n", "<leader>b" .. i, ":BufferLineGoToBuffer" .. i .. "<CR>")
			map("n", "<leader>bv" .. i, ":vsplit<CR>:BufferLineGoToBuffer" .. i .. "<CR>")
			map("n", "<leader>bx" .. i, ":split<CR>:BufferLineGoToBuffer" .. i .. "<CR>")
		end
	end,
}
