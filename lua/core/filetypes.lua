-- Detect unknown filetypes

local autocmd = vim.api.nvim_create_autocmd -- Create autocommand
local filetypes = {
	{
		pattern = { "*.ejs" },
		filetype = "html",
	},
	{
		pattern = { ".env*", "Procfile", "Procfile*" },
		filetype = "sh",
	},
	{
		pattern = { "*.templ" },
		filetype = "templ",
	},
	{
		pattern = { "*.ino" },
		filetype = "arduino",
	},
}

-- Open quickfix list item on new window
-- autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

for _, ft in ipairs(filetypes) do
	autocmd({ "BufNewFile", "BufRead" }, {
		pattern = ft.pattern,
		command = "set filetype=" .. ft.filetype,
	})
end
