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
