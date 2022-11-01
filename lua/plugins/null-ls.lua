local status, null_ls = pcall(require, "null-ls")
if not status then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

local eslint_files = { ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.yml" }

local sources = {
  -- actions
  actions.eslint,
  actions.refactoring,

  -- completions
  -- completion.spell,

  -- linters
  diagnostics.luacheck.with({
    extra_args = "--globals vim",
  }),
  diagnostics.eslint_d.with({
    condition = function(utils)
      return utils.root_has_file(eslint_files)
    end,
  }),
  diagnostics.erb_lint,
  diagnostics.jsonlint,
  diagnostics.yamllint.with({
    filetypes = { "yaml", "yml" },
  }),
  diagnostics.proselint.with({
    filetypes = { "text" },
  }),
  diagnostics.haml_lint,

  -- formatters
  formatting.prettierd.with({
    filetypes = { "html", "css", "scss" },
  }),
  formatting.eslint_d.with({
    condition = function(utils)
      return utils.root_has_file(eslint_files)
    end,
  }),
  formatting.erb_lint,
  formatting.autopep8,
  formatting.stylelint,
  formatting.stylua,
  formatting.beautysh,
  formatting.fixjson,
  formatting.mdformat,
}

local opts = { noremap = true, silent = true }

---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", ";a", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<F3>", ":Format<CR>", opts)
  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
})
