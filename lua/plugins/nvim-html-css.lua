return {
	"ESSO0428/nvim-html-css",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"sharkdp/fd",
		"hrsh7th/nvim-cmp",
	},
	lazy = true,
	config = function()
		require("html-css").setup()
	end,
}
