return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	lazy = false,
	config = function()
		require("Comment").setup({
			toggler = {
				---Line-comment toggle keymap
				line = "<leader>cc",
				---Block-comment toggle keymap
				block = "<leader>cb",
			},
			---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				---Line-comment toggle keymap
				line = "<leader>cc",
				---Block-comment toggle keymap
				block = "<leader>cb",
			},
		})
	end,
}
