local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local formatting = null_ls.builtins.formatting

local sources = {
	formatting.autopep8,
	formatting.stylua
}

local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<F3>", ":Format<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
