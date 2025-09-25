-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
return function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- local function buf_set_option(...)
	-- vim.api.nvim_buf_set_option(bufnr, ...)
	-- end

	-- Highlighting references
	if client.server_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
                      augroup lsp_document_highlight
                        autocmd! * <buffer>
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                      augroup END
                    ]],
			false
		)
	end

	-- Disable formatting for js/ts to allow conform.nvim to handle it
	if client.name == "ts_ls" then
		client.server_capabilities.documentFormattingProvider = false -- neovim 0.8 and later
	end

	-- Enable completion triggered by <c-x><c-o>
	-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {
		noremap = true,
		silent = true,
		desc = "Go to declaration",
	})

	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {
		noremap = true,
		silent = true,
		desc = "Go to definition",
	})

	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show hover",
	})
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {
		noremap = true,
		silent = true,
		desc = "Go to implementation",
	})
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show signature help",
	})
	-- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	-- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {
		noremap = true,
		silent = true,
		desc = "Go to type definition",
	})
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {
		noremap = true,
		silent = true,
		desc = "Rename",
	})
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show code actions",
	})
	-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {
	-- 	noremap = true,
	-- 	silent = true,
	-- 	desc = "Show references",
	-- })
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.open_float()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show diagnostics",
	})
	-- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	-- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>fl", "<cmd>lua vim.diagnostic.setqflist()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show diagnostics in quickfix list",
	})
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show diagnostics in location list",
	})

	-- Show all diagnostics on current line in floating window
	buf_set_keymap("n", "<Leader>da", ":lua vim.diagnostic.open_float()<CR>", {
		noremap = true,
		silent = true,
		desc = "Show diagnostics",
	})

	buf_set_keymap(
		"n",
		"<leader>dn",
		":lua vim.diagnostic.goto_next()<CR>",
		{ noremap = true, silent = true, desc = "Go to next diagnostic line" }
	)

	buf_set_keymap(
		"n",
		"<Leader>dp",
		":lua vim.diagnostic.goto_prev()<CR>",
		{ noremap = true, silent = true, desc = "Go to previous diagnostic line" }
	)
end
