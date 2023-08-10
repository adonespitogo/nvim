-- Import Lua modules

vim.lsp.set_log_level("off")

require("core/options")
require("core/autocmds")
require("core/keymaps")
require("core/vim-config")

-- plugins
require("lazy-init")
require("plugins/tokyo-theme")
require("plugins/cmp")
require("plugins/indent-blankline")
require("plugins/treesitter")
require("plugins/lualine")
require("plugins/telescope")
require("plugins/nvim-tree")
require("plugins/ruby-solargraph")
require("plugins/luasnip")
require("plugins/null-ls")
require("plugins/mason")
require("plugins/lsp-config")
require("plugins/bufferline")
require("plugins/neogen")
