local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "kyazdani42/nvim-web-devicons",
  "preservim/tagbar",
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  "folke/tokyonight.nvim",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
  "rafamadriz/friendly-snippets",
  "onsails/lspkind.nvim",

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enable = false,
        },
        suggestion = {
          enable = false,
          debounce = 250,
        },
        filetypes = {
          markdown = true,
        },
      })
    end,
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  {
    "adalessa/laravel.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-dotenv",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    keys = {
      { "<leader>ar", ":Laravel artisan<cr>" },
      { "<leader>rt", ":Laravel routes<cr>" },
      {
        "<leader>tn",
        function()
          require("laravel.tinker").send_to_tinker()
        end,
        mode = "v",
        desc = "Laravel Application Routes",
      },
    },
    config = function()
      require("laravel").setup()
      require("telescope").load_extension("laravel")
    end,
  },
  -- Buffers/Windows
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup({})
    end,
  },
  {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  "nvim-lualine/lualine.nvim",

  -- File browsers
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  },
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  },

  -- Formatters
  "lukas-reineke/indent-blankline.nvim",
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup({
        disable_filetype = { "TelescopPrompt", "vim" },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  "jose-elias-alvarez/null-ls.nvim",
  "MunifTanjim/prettier.nvim",
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    tag = "*",
  },
  "eandrju/cellular-automaton.nvim",

  -- Plug
  "tpope/vim-surround",
  "preservim/nerdcommenter",
  "moll/vim-bbye",
  "vim-scripts/argtextobj.vim",     -- provides 'a' (argument) text object
  "michaeljsmith/vim-indent-object", -- provides text objects base on indentation level ('ii', 'ai')
  "kana/vim-textobj-user",          -- prerequisite for vim-textobj* plugins
  {
    "tek/vim-textobj-ruby",
    dependencies = { "kana/vim-textobj-user" },
  },                        -- provides text objects base on ruby blocks ('vir', 'var')
  "alpertuna/vim-header",   -- Add author header to file
  "ekalinin/Dockerfile.vim", -- Dockerfile syntax highlighting
}

local opts = {}

require("lazy").setup(plugins, opts)
