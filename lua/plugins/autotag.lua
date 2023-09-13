-- Use treesitter to auto close and auto rename html tag

return {
	"windwp/nvim-ts-autotag",
	config = function()
		require("nvim-ts-autotag").setup({
			disable_filetype = { "TelescopPrompt", "vim" },
		})
	end,
}
