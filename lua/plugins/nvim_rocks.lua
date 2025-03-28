return {
	{
		"theHamsta/nvim_rocks",
		event = "VeryLazy",
		build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
		config = function()
			---- Add here the packages you want to make sure that they are installed
			local nvim_rocks = require("nvim_rocks")
			nvim_rocks.ensure_installed({
				"dkjson",
				"luacheck",
				"jsregexp",
			})
		end,
	},
}
