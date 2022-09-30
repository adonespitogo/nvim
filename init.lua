--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require("packer_init")
require("core/options")
require("core/autocmds")
require("core/keymaps")
require("core/colors")
require("plugins/nvim-cmp")
require("plugins/indent-blankline")
require("plugins/nvim-treesitter")
require("plugins/mason")
require("plugins/lualine")
require("plugins/bufferline")
require("plugins/telescope")
require("plugins/ruby-solargraph")
require("plugins/null_ls")
require("plugins/nvim-lspconfig")
