-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------
require("tokyonight").setup({
  style = "night",
  styles = {
    sidebars = "transparent"
  },
  on_colors = function(colors)
    colors.border = colors.dark3
  end,
})

vim.cmd([[ colorscheme tokyonight ]])
