return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local actions = null_ls.builtins.code_actions
		-- local completion = null_ls.builtins.completion
		local hover = null_ls.builtins.hover

		local sources = {
			-- actions
			actions.refactoring,
			actions.gitsigns,

			-- completions
			-- completion.spell,

			-- linters
			diagnostics.erb_lint,
			diagnostics.yamllint.with({
				filetypes = { "yaml", "yml" },
				extra_args = {
					"--config-data",
					"{extends: relaxed, rules: {line-length: {max: 120, level: warning}}}",
				},
			}),
			diagnostics.proselint.with({
				filetypes = { "text" },
			}),
			diagnostics.haml_lint,
			-- diagnostics.buf,

			-- formatters
			formatting.nginx_beautifier,
			formatting.blade_formatter,
			formatting.prettier.with({
				extra_filetypes = { "toml" },
			}),

			-- hover
			hover.dictionary,
		}

		local on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<leader>ca",
				"<CMD>lua vim.lsp.buf.code_action()<CR>",
				{ noremap = true, silent = true, desc = "Show code actions" }
			)
		end

		null_ls.setup({
			sources = sources,
			on_attach = on_attach,
		})
	end,
}
