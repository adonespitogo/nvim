-- For code annotations like jsdoc

local map = require("utils.keymap")

return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("neogen").setup({ snippet_engine = "luasnip" })
		map("n", "<F2>", ":lua require('neogen').generate()<CR>", { desc = "Add method annotation" })
	end,
}
