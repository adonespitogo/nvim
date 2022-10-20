-- Automatically install vim-plug on first boot

local fn = vim.fn
local install_path = (vim.env.XDG_DATA_HOME or (vim.env.HOME .. "/.local/share")) .. "/nvim/site/autoload/plug.vim"

if fn.empty(fn.glob(install_path)) > 0 then
  print("Installing vim-plug...")
  PlugBootstrap = fn.system({
    "curl",
    "-fLo",
    install_path,
    "--create-dirs",
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim",
  })
end

local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")
-- Install plugins not supported by packer
------------------------------------------
Plug("tpope/vim-surround")
Plug("preservim/nerdcommenter")
------------------------------------------
vim.call("plug#end")

if PlugBootstrap then
  vim.cmd([[
      PlugInstall
    ]])
end
