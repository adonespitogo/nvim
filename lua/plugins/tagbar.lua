return {
	"preservim/tagbar",
	config = function()
		local map = require("utils.keymap")

		map("n", "<leader>z", ":TagbarToggle fj<CR>") -- open/close
	end,
}
