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

-- Fix for double go to definition issue:
-- https://github.com/LuaLS/lua-language-server/issues/2451
local locations_to_items = vim.lsp.util.locations_to_items
vim.lsp.util.locations_to_items = function(locations, offset_encoding)
	local lines = {}
	local loc_i = 1
	for _, loc in ipairs(vim.deepcopy(locations)) do
		local uri = loc.uri or loc.targetUri
		local range = loc.range or loc.targetSelectionRange
		if lines[uri .. range.start.line] then -- already have a location on this line
			table.remove(locations, loc_i) -- remove from the original list
		else
			loc_i = loc_i + 1
		end
		lines[uri .. range.start.line] = true
	end

	return locations_to_items(locations, offset_encoding)
end
