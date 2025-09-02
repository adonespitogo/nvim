-- winbar plugin

return {
	"adonespitogo/barbecue.nvim",
	branch = "main",
	version = "*",
	name = "barbecue",
	-- dir = "/home/adonesp/Projects/barbecue.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		-- requires tokyonight
		require("barbecue").setup({
			theme = "tokyonight",
			show_dirname = false,
			show_basename = true,
			show_modified = true,
			show_diagnostics = true,
			lead_custom_section = function(_, winr)
				return " " .. vim.api.nvim_win_get_number(winr) .. " "
			end,
		})
	end,
}
