-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"theHamsta/nvim_rocks",
	},
	opts = {
		inlay_hints = { enabled = false },
	},
	config = function()
		local capabilities = require("utils.lsp.capabilities")
		local on_attach = require("utils.lsp.on_attach")
		local root_dir = require("utils.root-dir")

		local servers = {
			"bashls",
			"pbls",
			"pyright",
			"rust_analyzer",
			"jsonls",
			"cssls",
			"tailwindcss",
			"intelephense",
			"terraform_lsp",
		}

		-- with custom settings in /lsp directory
		local custom_servers = {
			"html",
			"emmet_language_server",
			"clangd",
			"lua_ls",
			"gopls",
			"templ",
			"omnisharp",
			"solargraph",
			"ts_ls",
			"sourcekit",
		}

		for _, lsp in ipairs(servers) do
			vim.lsp.config(lsp, {
				on_attach = on_attach,
				root_dir = root_dir,
				capabilities = capabilities,
			})
			vim.lsp.enable(lsp)
		end

		for _, lsp in ipairs(custom_servers) do
			vim.lsp.enable(lsp)
		end

        -- Fix floating window borders
		local ui_windows = require("lspconfig.ui.windows")
		ui_windows.default_options.border = "single"
		local border = {
			{ "╭", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╮", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "╯", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "╰", "FloatBorder" },
			{ "│", "FloatBorder" },
		}
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end

	end,
}
