vim.lsp.set_log_level("off")

-- Check if the operating system is macOS
local is_macos = vim.fn.has("mac") == 1
if is_macos then
	vim.g.tagbar_ctags_bin = "/opt/homebrew/bin/ctags"
end

-- Diagnostic options, see: `:help vim.diagnostic.config`
vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = false,
	float = {
		focusable = false,
		border = "rounded",
		source = "always",
	},
})

-- Show line diagnostics automatically in hover window
-- vim.cmd([[
-- autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
-- ]])vim.lsp.handlers["textDocument/hover"] =

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
