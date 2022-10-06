require("nvim-tree").setup({
  -- sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "h", action = "dir_up" },
        { key = "l", action = "cd" },
      },
    },
  },
  -- renderer = {
  --   group_empty = true,
  -- },
   filters = {
     dotfiles = false,
   },
})
