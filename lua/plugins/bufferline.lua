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

		-- Requires transparent.nvim
		-- https://github.com/xiyaowong/transparent.nvim?tab=readme-ov-file#gtransparent_groups
		vim.g.transparent_groups = vim.list_extend(
			vim.g.transparent_groups or {},
			vim.tbl_map(function(v)
				return v.hl_group
			end, vim.tbl_values(require("bufferline.config").highlights))
		)

		map("n", "<leader>bh", ":BufferLineCyclePrev<CR>", { desc = "Cycle previous buffer" })
		map("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Cycle previous buffer" })
		map("n", "<leader>bl", ":BufferLineCycleNext<CR>", { desc = "Cycle next buffer" })
		map("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Cycle next buffer" })
		map("n", "<leader>bdo", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers except current" })
		map("n", "<leader>bdl", ":BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
		map("n", "<leader>bdh", ":BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
		map("n", "<leader>bmn", ":BufferLineMoveNext<CR>", { desc = "Move buffer to the right" })
		map("n", "<leader>bmp", ":BufferLineMovePrev<CR>", { desc = "Move buffer to the left" })

		for i = 0, 9, 1 do
			-- Go to buffer by leader+number
			map("n", "<leader>b" .. i, ":BufferLineGoToBuffer" .. i .. "<CR>")
			map("n", "<leader>bv" .. i, ":vsplit<CR>:BufferLineGoToBuffer" .. i .. "<CR>")
			map("n", "<leader>bx" .. i, ":split<CR>:BufferLineGoToBuffer" .. i .. "<CR>")
		end
	end,
}
