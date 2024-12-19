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
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local ui_windows = require("lspconfig.ui.windows")
		local root_dir = require("utils.root-dir")

		ui_windows.default_options.border = "single"

		-- Add additional capabilities supported by nvim-cmp
		-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

		capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion.completionItem.preselectSupport = true
		capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
		capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
		capabilities.textDocument.completion.completionItem.deprecatedSupport = true
		capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
		capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
		capabilities.textDocument.completion.completionItem.resolveSupport = {
			properties = {
				"documentation",
				"detail",
				"additionalTextEdits",
			},
		}

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		local on_attach = function(client, bufnr)
			local function buf_set_keymap(...)
				vim.api.nvim_buf_set_keymap(bufnr, ...)
			end

			-- local function buf_set_option(...)
			-- vim.api.nvim_buf_set_option(bufnr, ...)
			-- end

			-- Highlighting references
			if client.server_capabilities.document_highlight then
				vim.api.nvim_exec(
					[[
                      augroup lsp_document_highlight
                        autocmd! * <buffer>
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                      augroup END
                    ]],
					false
				)
			end

			-- Disable formatting for js/ts to allow conform.nvim to handle it
			if client.name == "ts_ls" then
				client.server_capabilities.documentFormattingProvider = false -- neovim 0.8 and later
			end

			-- Enable completion triggered by <c-x><c-o>
			-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.

			-- See `:help vim.lsp.*` for documentation on any of the below functions
			buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {
				noremap = true,
				silent = true,
				desc = "Go to declaration",
			})

			buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {
				noremap = true,
				silent = true,
				desc = "Go to definition",
			})

			buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show hover",
			})
			buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {
				noremap = true,
				silent = true,
				desc = "Go to implementation",
			})
			buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show signature help",
			})
			-- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
			-- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
			-- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
			buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {
				noremap = true,
				silent = true,
				desc = "Go to type definition",
			})
			buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {
				noremap = true,
				silent = true,
				desc = "Rename",
			})
			buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show code actions",
			})
			-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {
			-- 	noremap = true,
			-- 	silent = true,
			-- 	desc = "Show references",
			-- })
			buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.open_float()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show diagnostics",
			})
			-- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
			-- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
			buf_set_keymap("n", "<space>fl", "<cmd>lua vim.diagnostic.setqflist()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show diagnostics in quickfix list",
			})
			buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show diagnostics in location list",
			})

			-- Show all diagnostics on current line in floating window
			buf_set_keymap("n", "<Leader>da", ":lua vim.diagnostic.open_float()<CR>", {
				noremap = true,
				silent = true,
				desc = "Show diagnostics",
			})

			buf_set_keymap(
				"n",
				"<leader>dn",
				":lua vim.diagnostic.goto_next()<CR>",
				{ noremap = true, silent = true, desc = "Go to next diagnostic line" }
			)

			buf_set_keymap(
				"n",
				"<Leader>dp",
				":lua vim.diagnostic.goto_prev()<CR>",
				{ noremap = true, silent = true, desc = "Go to previous diagnostic line" }
			)
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
			"templ",
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

		lspconfig["omnisharp"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			cmd = { "omnisharp", "--languageserver" },
		})

		lspconfig["volar"].setup({
			on_attach = on_attach,
			root_dir = root_dir,
			capabilities = capabilities,
			filetypes = { "vue" },
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
