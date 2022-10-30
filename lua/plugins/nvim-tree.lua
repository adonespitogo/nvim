require("nvim-tree").setup({
  reload_on_bufenter = true,
  diagnostics = {
    enable = true
  },
  git = {
    ignore = false,
  },
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "H", action = "dir_up" },
        { key = "L", action = "cd" },
      },
    },
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$", ".DS_Store" },
  },
})
