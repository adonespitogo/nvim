local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions

diagnostics.proselint.filetypes = { "markdown", "text" }

local sources = {
  -- actions
  actions.eslint,

  -- linters
  diagnostics.eslint,
  --diagnostics.haml_lint,
  diagnostics.erb_lint,
  diagnostics.jsonlint,
  diagnostics.proselint,

  -- formatters
  -- formatting.haml_lint,
  formatting.prettierd,
  formatting.erb_lint,
  formatting.autopep8,
  formatting.stylelint,
  formatting.stylua,
}

local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ';a', '<CMD>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<F3>", ":Format<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
