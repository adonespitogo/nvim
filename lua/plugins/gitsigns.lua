return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local gitsigns = require("gitsigns")
    local map = require("utils.keymap")

		gitsigns.setup({
			on_attach = function(bufnr)

				-- Navigation
				map("n", "<leader>gn", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Go to next git changed line" })

				map("n", "<leader>gp", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Go to previous git changed line" })
			end,
		})
	end,
}
