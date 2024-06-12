return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			templ = { "prettier", "templ" },
			eruby = { "prettier", "htmlbeautifier" },
			html = { "prettier", "htmlbeautifier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			sh = { "beautysh" },
			yaml = { "yamlfix", "yamlfmt" },
			markdown = { "typos" },
		},
	},
}
