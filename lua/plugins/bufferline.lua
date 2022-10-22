require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		numbers = "buffer_id",
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
