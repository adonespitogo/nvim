-- LuaSnip Snippet History Fix (Seems to work really well, I think.)
local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = "*",
  callback = function()
    if
        ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
        and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
        and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
  group = luasnip_fix_augroup,
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("ruby", { "rails" })
