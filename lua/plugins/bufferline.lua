require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		numbers = "ordinal",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
	},
})
