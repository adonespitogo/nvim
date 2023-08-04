-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------
require("tokyonight").setup({
  style = "night",
  styles = {
    sidebars = "transparent",
  },

  -- Add border between file tree and document
  on_colors = function(colors)
    colors.border = colors.blue
  end,
})

vim.cmd([[ colorscheme tokyonight ]])
