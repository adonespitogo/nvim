return {
	select = {
		enable = true,
		lookahead = true,
		keymaps = {
			["aa"] = { query = "@parameter.outer", desc = "Select outer part of an assignment" },
			["ia"] = { query = "@parameter.inner", desc = "Select inner part of an assignment" },

			["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
			["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

			["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
			["if"] = { query = "@function.inner", desc = "Select inner part of a function" },

			["ac"] = { query = "@class.outer", "Select outer part of class" },
			["ic"] = { query = "@class.inner", "Select inner part of class" },
		},
	},
	move = {
		enable = true,
		set_jumps = true,
		goto_next_start = {
			["]f"] = "@function.outer",
		},
		goto_next_end = {
			["]F"] = "@function.outer",
		},
		goto_previous_start = {
			["[f"] = "@function.outer",
		},
		goto_previous_end = {
			["[F"] = "@function.outer",
		},
	},
}
