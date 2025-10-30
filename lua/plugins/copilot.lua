return {
	"zbirenbaum/copilot-cmp",
	dependencies = {
		{
			"zbirenbaum/copilot.lua",
			dependencies = {
				{
					"copilotlsp-nvim/copilot-lsp",
					init = function()
						vim.g.copilot_nes_debounce = 500
					end,
					config = function()
						require("copilot").setup({})
					end,
				},
			},
		},
	},
	config = function()
		require("copilot_cmp").setup({
			nes = {
				enabled = true,
				keymap = {
					accept_and_goto = "<leader>p",
					accept = false,
					dismiss = "<Esc>",
				},
			},
		})
	end,
}
