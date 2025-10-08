-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "*",
	command = ":%s/\\s\\+$//e",
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Settings for filetypes:
-- Disable line length marker
augroup("setLineLength", { clear = true })
autocmd("Filetype", {
	group = "setLineLength",
	pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
	command = "setlocal cc=0",
})

-- Terminal settings:
-- Open a Terminal on the right tab
autocmd("CmdlineEnter", {
	command = "command! Term :botright split term://$SHELL",
})

-- Enter insert mode when switching to terminal
autocmd("TermOpen", {
	command = "setlocal listchars= nonumber norelativenumber nocursorline",
})

autocmd("TermOpen", {
	pattern = "*",
	command = "startinsert",
})

-- Close terminal buffer on process exit
autocmd("BufLeave", {
	pattern = "term://*",
	command = "stopinsert",
})

-- Close empty buffers on file open
autocmd("BufReadPost", {
	pattern = { "*" },
	callback = function()
		local close_empty_buffers = require("utils.close-empty-buf")
		close_empty_buffers()
	end,
})

-- Automatically organize golang imports, then format on save
-- vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = false })]])

-- autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params()
-- 		params.context = {
-- 			only = { "source.organizeImports" },
-- 		}
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
-- 		for _, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.kind == "source.organizeImports" then
-- 					vim.lsp.buf.code_action({
-- 						apply = true,
-- 						context = {
-- 							diagnostics = {},
-- 							only = { "source.organizeImports" },
-- 						},
-- 					})
-- 				end
-- 			end
-- 		end
-- 		vim.lsp.buf.format({ async = false })
-- 	end,
-- })

-- Auto organize imports and format Go files before save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		-- Prepare params for organize imports
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }

		-- Synchronously request code actions
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		if result then
			for _, res in pairs(result) do
				for _, r in pairs(res.result or {}) do
					if r.edit or type(r.command) == "table" then
						-- Apply workspace edit directly if available
						if r.edit then
							vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
						end
						-- Execute command if needed
						if r.command then
							vim.lsp.buf.execute_command(r.command)
						end
					end
				end
			end
		end

		-- Format the file synchronously
		vim.lsp.buf.format({ async = false })
	end,
})
