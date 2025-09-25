local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")
local root_dir = require("utils.root-dir")

local golang_root = require("utils.golang_root")
local load_goplsrc = require("utils.load_goplsrc")
local gopls = load_goplsrc()

return {
	cmd = { "/home/adonesp/.local/bin/templ", "lsp" },
	filetypes = { "templ" },
	on_attach = on_attach,
	root_dir = golang_root,
	capabilities = capabilities,
	settings = {
		gopls = gopls,
	},
}
