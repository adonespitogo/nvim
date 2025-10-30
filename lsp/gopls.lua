local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")

local golang_root = require("utils.golang_root")
local load_goplsrc = require("utils.load_goplsrc")

return {
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod", "gowork" },
	on_attach = on_attach,
	root_dir = golang_root,
	capabilities = capabilities,
	settings = {
		gopls = load_goplsrc(),
	},
	init = function()
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
	end,
}
