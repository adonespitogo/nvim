return {
	"xiyaowong/transparent.nvim",
	config = function()
		-- https://github.com/xiyaowong/transparent.nvim?tab=readme-ov-file#gtransparent_groups
		vim.g.transparent_groups = vim.list_extend(
			vim.g.transparent_groups or {},
			vim.tbl_map(function(v)
				return v.hl_group
			end, vim.tbl_values(require("bufferline.config").highlights))
		)

		local transparent = require("transparent")
		transparent.setup({})
		transparent.clear_prefix("BufferLine")
		transparent.clear_prefix("NvimTree")
		-- transparent.clear_prefix("lualine")
	end,
}
