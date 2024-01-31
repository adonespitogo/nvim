return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local actions = null_ls.builtins.code_actions
		-- local completion = null_ls.builtins.completion
		local hover = null_ls.builtins.hover

		local eslint_files = { ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.yml" }

		local sources = {
			-- actions
			actions.eslint,
			actions.refactoring,

			-- completions
			-- completion.spell,

			-- linters
			-- diagnostics.luacheck.with({
			-- 	extra_args = { globals = "vim" },
			-- }),
			diagnostics.eslint.with({
				condition = function(utils)
					return utils.root_has_file(eslint_files)
				end,
			}),
			diagnostics.erb_lint,
			diagnostics.jsonlint,
			diagnostics.yamllint.with({
				filetypes = { "yaml" },
			}),
			diagnostics.proselint.with({
				filetypes = { "text" },
			}),
			diagnostics.haml_lint,
			diagnostics.buf,

			-- formatters
			formatting.eslint.with({
				condition = function(utils)
					return utils.root_has_file(eslint_files)
				end,
			}),
			formatting.prettier.with({
				filetypes = { "html", "css", "scss", "javascript", "typescript", "yaml", "vue" },
			}),
			formatting.erb_lint,
			formatting.autopep8,
			formatting.stylua,
			formatting.beautysh,
			formatting.fixjson,
			formatting.mdformat,
			formatting.nginx_beautifier,
			formatting.buf,
			formatting.sqlfluff.with({
				extra_args = { "--dialect", os.getenv("SQL_DIALECT") or "mysql" }, -- change to your dialect
			}),
			formatting.blade_formatter,

			-- hover
			hover.dictionary,
		}

		local on_attach = function(_, bufnr)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				";ca",
				"<CMD>lua vim.lsp.buf.code_action()<CR>",
				{ noremap = true, silent = true, desc = "Show code actions" }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<F3>",
				":Format<CR>",
				{ noremap = true, silent = true, desc = "Format code" }
			)
			vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])
		end

		null_ls.setup({
			sources = sources,
			on_attach = on_attach,
		})
	end,
}
