return function(_, bufnr)
	local bufname = vim.api.nvim_buf_get_name(bufnr or 0)
	if bufname == "" then
		return vim.fn.getcwd()
	end
	return vim.fs.root(bufnr or 0, { "go.work", "go.mod", ".git" })
end
