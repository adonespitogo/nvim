return {
	"JoosepAlviste/nvim-ts-context-commentstring",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			-- Disable autocmd for commentstring
			-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#plugins-with-a-pre-comment-hook
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
