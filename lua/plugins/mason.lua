require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "pyright",
    "rust_analyzer",
    "tsserver",
    "solargraph",
    "jsonls",
    "cssls",
    "html",
    "clangd",
    "lua_ls",
    "gopls",
    "sqls",
    "intelephense",
  },
})
