return {
	"yuchanns/phpfmt.nvim",
	config = function()
		require("phpfmt").setup({
			-- Default configs
			cmd = "phpcbf",
			standard = "PSR12",
			auto_format = false,
		})
	end,
}
