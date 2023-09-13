return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })
	end,
	config = function()
		local nvim_treesitter = require("nvim-treesitter.configs")
		nvim_treesitter.setup({
			-- A list of parser names, or "all"
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"rust",
				"typescript",
				"vim",
				"yaml",
				"go",
				"php",
			},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			highlight = {
				-- `false` will disable the whole extension
				enable = true,
			},
		})

		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
	end,
}
