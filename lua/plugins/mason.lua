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
    "sumneko_lua",
    "gopls",
    "sqls",
    "intelephense",
  },
})
