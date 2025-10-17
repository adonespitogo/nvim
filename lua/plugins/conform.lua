return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				css = { "prettier" },
				eruby = { "htmlbeautifier" },
				markdown = { "typos", "mdformat" },
				html = { "htmlbeautifier" },
				javascript = { "prettier" },
				json = { "fixjson" },
				lua = { "stylua" },
				proto = { "buf" },
				sh = { "beautysh" },
				sql = { "sqlfmt" },
				templ = { "templ" },
				typescript = { "prettier" },
				vue = { "prettier" },
				liquid = { "htmlbeautifier" },
				yaml = { "yamlfix", "yamlfmt" },
				terraform = { "terraform_fmt" },
				toml = { "taplo" },
			},
		})
	end,
}
