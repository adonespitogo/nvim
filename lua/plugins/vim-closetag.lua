return {
	"alvan/vim-closetag",
	event = "BufRead",
	setup = function()
		vim.g.closetag_emptyTags_caseSensitive = 1
		-- Some other settings
	end,
}
