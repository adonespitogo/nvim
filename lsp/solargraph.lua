local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")
local root_dir = require("utils.root-dir")

return {
  cmd = {"solargraph", "stdio" },
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"ruby",
	},
}
