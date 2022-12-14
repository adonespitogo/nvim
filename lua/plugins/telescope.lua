local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

--telescope.setup {
--  defaults = {
--    mappings = {
--      n = {
--        ["q"] = actions.close
--      },
--    },
--  },
--}
--
--keymaps
--vim.keymap.set('n', ';f',
--  function()
--    builtin.find_files({
--      no_ignore = false,
--      hidden = true
--    })
--  end)
--vim.keymap.set('n', ';r', function()
--  builtin.live_grep()
--end)
--vim.keymap.set('n', '\\\\', function()
--  builtin.buffers()
--end)
--vim.keymap.set('n', ';t', function()
--  builtin.help_tags()
--end)
--vim.keymap.set('n', ';;', function()
--  builtin.resume()
--end)
--vim.keymap.set('n', ';e', function()
--  builtin.diagnostics()
--end)

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "%.git/",
      "node%_modules/.*",
    },
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

vim.keymap.set("n", "<leader>ff", function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
  })
end)
vim.keymap.set("n", "<leader>fg", function()
  builtin.live_grep({
    no_ignore = false,
    hidden = true,
  })
end)

telescope.load_extension("ui-select")
