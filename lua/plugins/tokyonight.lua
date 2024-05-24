-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

return {
	"folke/tokyonight.nvim",
	config = function()
		require("tokyonight").setup({
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			-- Add border between file tree and document
			on_colors = function(colors)
				-- colors.bg = "#040603"
				-- colors.bg_dark = "#030305"
				-- colors.bg_float = colors.bg_dark
				-- colors.bg_highlight = "#292e42"
				-- colors.bg_popup = colors.bg_dark
				-- colors.bg_search = "#3d59a1"
				-- colors.bg_sidebar = colors.bg_dark
				-- colors.bg_statusline = colors.bg_dark
				-- colors.bg_visual = "#283457"
				-- colors.border = colors.blue7
				colors.border = colors.magenta
			end,
		})

		vim.cmd([[ colorscheme tokyonight ]])
	end,
}
