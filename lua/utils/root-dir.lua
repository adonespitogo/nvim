---@return string
return function()
	local util = require("lspconfig/util")
	local fn = util.root_pattern("go.work", "go.mod", ".git", "Gemfile")
	return fn() or vim.fn.getcwd()
end
