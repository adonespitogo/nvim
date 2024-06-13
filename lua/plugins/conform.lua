return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			eruby = { "prettier", "htmlbeautifier" },
			markdown = { "typos", "mdformat" },
			html = { "prettier", "htmlbeautifier" },
			javascript = { "prettier" },
			lua = { "stylua" },
			proto = { "buf" },
			sh = { "beautysh" },
			sql = { "pg_format" },
			templ = { "prettier", "templ" },
			typescript = { "prettier" },
			vue = { "prettier" },
			yaml = { "yamlfix", "yamlfmt" },
		},
	},
}
