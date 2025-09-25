return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		local capabilities = require("utils.lsp.capabilities")
		local on_attach = require("utils.lsp.on_attach")
		require("flutter-tools").setup({
			lsp = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
	end,
}
