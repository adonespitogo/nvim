local capabilities = require("utils.lsp.capabilities")
local on_attach = require("utils.lsp.on_attach")
local root_dir = require("utils.root-dir")

return {
	on_attach = on_attach,
	root_dir = root_dir,
	filetypes = { "html", "eruby", "templ", "vue" },
	capabilities = capabilities,
}
