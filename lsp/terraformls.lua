local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")

return {
	on_attach = on_attach,
	capabilities = capabilities,
}
