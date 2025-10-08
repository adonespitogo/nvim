local util = require("lspconfig.util")

---@return string
return function()
	local root_dir = util.root_pattern("go.work", "go.mod", ".git")
	return root_dir(vim.fn.getcwd())
end
