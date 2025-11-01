return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for default `toggle()` implementation.
		{ "folke/snacks.nvim", opts = { auto_reload = true } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
		}

		vim.keymap.set({ "n", "x" }, "<leader>ck", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode" })

		vim.keymap.set({ "n", "x" }, "<leader>cx", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })

		vim.keymap.set("n", "<leader>co", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set("n", "<leader>cd", function()
			require("opencode").prompt("@diagnostics: ", { submit = true })
		end, { desc = "Prompt diagnostics opencode" })
	end,
}
