return {
	"alvan/vim-closetag",
	event = "BufRead",
	setup = function()
		vim.g.closetag_emptyTags_caseSensitive = 1
		vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.templ"
		-- Some other settings
	end,
}
