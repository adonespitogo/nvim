local map = require("utils.keymap")

return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	config = function()
		local chatgpt = require("chatgpt")
		chatgpt.setup()

		map("n", "<leader>ci", ":ChatGPTEditWithInstructions<CR>", { desc = "Chat-GPT: Edit with instractions" })
		map("v", "<leader>ci", ":ChatGPTEditWithInstructions<CR>", { desc = "Chat-GPT: Edit with instractions" })

		map("n", "<leader>cg", ":ChatGPT<CR>", { desc = "Chat-GPT: Start Chat" })
		map("v", "<leader>cg", ":ChatGPT<CR>", { desc = "Chat-GPT: Start Chat" })

		map("n", "<leader>co", ":ChatGPTRun optimize_code<CR>", { desc = "Chat-GPT: Optimize code" })
		map("v", "<leader>co", ":ChatGPTRun optimize_code<CR>", { desc = "Chat-GPT: Optimize code" })

		map("n", "<leader>ct", ":ChatGPTRun translate<CR>", { desc = "Chat-GPT: Translate" })
		map("v", "<leader>ct", ":ChatGPTRun translate<CR>", { desc = "Chat-GPT: Translate" })

		map("n", "<leader>cf", ":ChatGPTRun fix_bugs<CR>", { desc = "Chat-GPT: Fix bugs" })
		map("v", "<leader>cf", ":ChatGPTRun fix_bugs<CR>", { desc = "Chat-GPT: Fix bugs" })

		map("n", "<leader>ce", ":ChatGPTRun explain_code<CR>", { desc = "Chat-GPT: Explain code" })
		map("v", "<leader>ce", ":ChatGPTRun explain_code<CR>", { desc = "Chat-GPT: Explain code" })

		map("n", "<leader>cs", ":ChatGPTActAs<CR>", { desc = "Chat-GPT: Act as consultant" })
		map("v", "<leader>cs", ":ChatGPTActAs<CR>", { desc = "Chat-GPT: Act as consultant" })
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim", -- optional
		"nvim-telescope/telescope.nvim",
	},
}
