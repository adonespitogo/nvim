-- winbar plugin
return {
	"adonespitogo/barbecue.nvim",
	name = "barbecue",
	branch = "feature/show-diagnostics",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		require("barbecue").setup({
			attach_navic = false, -- prevent barbecue from automatically attaching nvim-navic
			show_dirname = false,
			show_basename = true,
			show_modified = true,
			show_diagnostics = true,
			lead_custom_section = function(_, winr)
				return " " .. vim.api.nvim_win_get_number(winr) .. " "
			end,
		})

		require("lspconfig")["nvim-navic"].setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities["documentSymbolProvider"] then
					require("nvim-navic").attach(client, bufnr)
				end
			end,
		})
	end,
}