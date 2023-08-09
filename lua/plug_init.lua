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

------------------------------------------
-- Install plugins not supported by packer
------------------------------------------
Plug("tpope/vim-surround")
Plug("preservim/nerdcommenter")
Plug("moll/vim-bbye")
Plug("vim-scripts/argtextobj.vim")      -- provides 'a' (argument) text object
Plug("michaeljsmith/vim-indent-object") -- provides text objects base on indentation level ('ii', 'ai')
Plug("kana/vim-textobj-user")           -- prerequisite for vim-textobj* plugins
Plug("tek/vim-textobj-ruby")            -- provides text objects base on ruby blocks ('vir', 'var')
Plug("alpertuna/vim-header")            -- Add author header to file
Plug("ekalinin/Dockerfile.vim")         -- Dockerfile syntax highlighting

------------------------------------------

vim.call("plug#end")

if PlugBootstrap then
  vim.cmd([[ PlugInstall ]])
end
