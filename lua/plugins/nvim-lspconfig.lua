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
		local lspconfig = require("lspconfig")
		local ui_windows = require("lspconfig.ui.windows")
		local capabilities = require("utils.lsp.capabilities")
		local on_attach = require("utils.lsp.on_attach")
		local root_dir = require("utils.root-dir")

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

		--[[

Language servers setup:

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

--]]
		-- Define `root_dir` when needed
		-- See: https://github.com/neovim/nvim-lspconfig/issues/320
		-- This is a workaround, maybe not work with some servers.

		-- Use a loop to conveniently call 'setup' on multiple servers and
		-- map buffer local keybindings when the language server attaches.
		-- Add your language server below:
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

		-- Call setup
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				root_dir = root_dir,
				capabilities = capabilities,
			})
		end

		lspconfig["html"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			filetypes = { "html", "eruby", "templ", "vue" },
		})

		lspconfig["emmet_language_server"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			filetypes = { "html", "eruby", "templ", "vue" },
			capabilities = capabilities,
		})

		lspconfig["clangd"].setup({
			filetypes = { "clang", "cpp", "c" },
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
		})

		lspconfig["lua_ls"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		local golang_root = require("utils.golang_root")
		local load_goplsrc = require("utils.load_goplsrc")
		local gopls = load_goplsrc()

		lspconfig["gopls"].setup({
			cmd = { "gopls", "serve" },
			filetypes = { "go", "gomod", "gowork" },
			on_attach = on_attach,
			root_dir = golang_root,
			capabilities = capabilities,
			settings = {
				gopls = gopls,
			},
		})

		lspconfig["templ"].setup({
			cmd = { "/home/adonesp/.local/bin/templ", "lsp" },
			filetypes = { "templ" },
			on_attach = on_attach,
			root_dir = golang_root,
			capabilities = capabilities,
			settings = {
				gopls = gopls,
			},
		})

		lspconfig["omnisharp"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			cmd = { "omnisharp", "--languageserver" },
		})

		lspconfig["solargraph"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			filetypes = {
				"ruby",
			},
		})

		lspconfig["ts_ls"].setup({
			init_options = {
				preferences = {
					-- TODO: Why disable this?
					disableSuggestions = true,
				},
			},
		})
	end,
}
