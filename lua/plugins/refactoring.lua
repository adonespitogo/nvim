local map = require("utils.keymap")

return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-treesitter/nvim-treesitter" },
	},
	config = function()
		require("refactoring").setup()

		-- Trigger refactoring plugin then auto format
		-- map("v", "<leader><space>a", ":'<,'>lua vim.lsp.buf.code_action()<CR>", opts)
		map(
			"v",
			"<leader>ev",
			[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
			{ noremap = true, silent = true, expr = false, desc = "Extract to variable" }
		)
		map(
			"v",
			"<leader>iv",
			[[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
			{ noremap = true, silent = true, expr = false, desc = "Inline variable" }
		)
		map(
			"v",
			"<leader>ef",
			[[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
			{ noremap = true, silent = true, expr = false, desc = "Extract to function" }
		)
	end,
}
