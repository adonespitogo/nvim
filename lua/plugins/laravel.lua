return {
	"adalessa/laravel.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"tpope/vim-dotenv",
		"MunifTanjim/nui.nvim",
	},
	cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
	keys = {
		{ "<leader>ar", ":Laravel artisan<cr>" },
		{ "<leader>rt", ":Laravel routes<cr>" },
		{
			"<leader>tn",
			function()
				require("laravel.tinker").send_to_tinker()
			end,
			mode = "v",
			desc = "Laravel Application Routes",
		},
	},
	config = function()
		require("laravel").setup()
		require("telescope").load_extension("laravel")
	end,
}
