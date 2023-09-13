-- provides text objects base on ruby blocks ('vir', 'var')

return {
	"kana/vim-textobj-user", -- prerequisite for vim-textobj* plugins
	dependencies = {
		"tek/vim-textobj-ruby",
		"vim-scripts/argtextobj.vim",
		"michaeljsmith/vim-indent-object", -- provides text objects base on indentation level ('ii', 'ai')
	},
}
