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
vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.format({ async = false })]])

autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = {
			only = { "source.organizeImports" },
		}
		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.kind == "source.organizeImports" then
					vim.lsp.buf.code_action({
						apply = true,
						context = {
							only = { "source.organizeImports" },
						},
					})
					-- vim.cmd("write")
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})

autocmd("BufWritePost", {
	pattern = "*.go",
	command = "edit",
})
