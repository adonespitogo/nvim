return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	configure = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"delve",
				"coreclr",
			},
			handlers = {
				function(config)
					-- all sources with no handler get passed here
					-- Keep original functionality
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
	end,
}
