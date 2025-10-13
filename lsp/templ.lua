local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")

local load_goplsrc = require("utils.load_goplsrc")
local gopls = load_goplsrc()

return {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		gopls = gopls,
	},
}
