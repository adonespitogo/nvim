return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enable = false,
			},
			suggestion = {
				enable = false,
				debounce = 250,
			},
			filetypes = {
				markdown = true,
			},
		})
	end,
	dependencies = {
		{
			"zbirenbaum/copilot-cmp",
			config = true,
		},
	},
}
