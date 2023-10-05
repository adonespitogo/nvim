-- Use treesitter to auto close and auto rename html tag

return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
				disable_filetype = { "TelescopPrompt", "vim" },
			},
		})
	end,
}
