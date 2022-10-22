local winbar_components = {
  active = { {}, {} },
  inactive = { {}, {} },
}

winbar_components.active[1][1] = {
  provider = function ()
    return "[".. vim.api.nvim_win_get_number(0) .. "] "
  end,
}

winbar_components.active[1][2] = {
  provider = "file_info",
  hl = {
    fg = "skyblue",
    bg = "NONE",
    style = "bold",
  },
}

winbar_components.inactive[1][1] = {
  provider = function ()
    return "[".. vim.api.nvim_win_get_number(0) .. "] "
  end,
}

winbar_components.inactive[1][2] = {
  provider = "file_info",
  hl = {
    fg = "gray",
    bg = "NONE",
    style = "bold",
  },
}

require("feline").setup()
require("feline").winbar.setup({
  components = winbar_components,
})
