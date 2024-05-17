return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"pyright",
				"rust_analyzer",
				"tsserver",
				"solargraph",
				"jsonls",
				"cssls",
				"tailwindcss",
				"html",
				"clangd",
				"lua_ls",
				"gopls",
				"intelephense",
				"volar",
				"omnisharp",
				"eslint",
				"templ",
			},
		})
	end,
}
