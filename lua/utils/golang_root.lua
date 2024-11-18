local util = require("lspconfig/util")
local root_dir = util.root_pattern("go.work", "go.mod", ".git")

---@return string
return function()
	return root_dir() or vim.fn.getcwd()
end
