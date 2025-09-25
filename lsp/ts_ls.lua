local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")

return {
	init_options = {
		on_attach = on_attach,
		capabilities = capabilities,
		preferences = {
			-- TODO: Why disable this?
			disableSuggestions = true,
		},
	},
}
