local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")

return {
	filetypes = { "clang", "cpp", "c" },
	on_attach = on_attach,
	capabilities = capabilities,
}
