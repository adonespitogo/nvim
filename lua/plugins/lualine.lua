return {
	"nvim-lualine/lualine.nvim",
    event = "VeryLazy",
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
                theme = "ayu_mirage",
			},
		})
	end,
}
