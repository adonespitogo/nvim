return {
  "adonespitogo/Arduino-Nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Setup Arduino LSP configuration using Neovim 0.11 native API
		local function setup_arduino_lsp()
			-- Load Arduino config
			local config_file = vim.fn.getcwd() .. "/.arduino_config.lua"
			local settings = { board = "arduino:avr:uno", port = "/dev/ttyACM0" }

			if vim.fn.filereadable(config_file) == 1 then
				local config = loadfile(config_file)
				if config then
					local ok, loaded_settings = pcall(config)
					if ok and loaded_settings then
						settings = loaded_settings
					end
				end
			end

			local board = settings.board or "arduino:avr:uno"
			local clangd_path = vim.fn.exepath("clangd") or "/usr/bin/clangd"
			local arduino_cli_config = vim.fn.expand("$HOME/.arduino15/arduino-cli.yaml")

			-- Configure arduino_language_server using native vim.lsp.config
			vim.lsp.config("arduino_language_server", {
				cmd = {
					"arduino-language-server",
					"-cli",
					"arduino-cli",
					"-cli-config",
					arduino_cli_config,
					"-clangd",
					clangd_path,
					"-fqbn",
					board,
				},
				filetypes = { "arduino" },
				root_markers = { ".git", "sketch.yaml", ".arduino_config.lua" },
			})
		end

		-- Setup LSP on plugin load
		setup_arduino_lsp()

		-- Load Arduino plugin for .ino files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "arduino",
			callback = function()
				require("Arduino-Nvim")
				-- Enable the LSP for this buffer
				vim.lsp.enable("arduino_language_server")
			end,
		})
	end,
}
