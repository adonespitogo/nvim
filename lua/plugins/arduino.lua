return {
	"adonespitogo/Arduino-Nvim",
	branch = "main",
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

		-- Create :InoDeploy command that runs :InoDataUpload then :InoWatchUpload after it finishes
		vim.api.nvim_create_user_command("InoDeploy", function()
			local arduino = require("Arduino-Nvim")
			local original_append = arduino.append_to_buffer

			-- Wrap append_to_buffer to detect completion
			arduino.append_to_buffer = function(lines, buf, win, opts)
				original_append(lines, buf, win, opts)

				-- Check if upload completed or failed
				for _, line in ipairs(type(lines) == "table" and lines or { lines }) do
					if line:match("LittleFS Upload Complete") then
						-- Restore original function
						arduino.append_to_buffer = original_append
						-- Close the current window and run InoWatchUpload
						vim.defer_fn(function()
							if vim.api.nvim_win_is_valid(win) then
								vim.api.nvim_win_close(win, true)
							end
							vim.cmd("InoWatchUpload")
						end, 1000)
						return
					elseif line:match("LittleFS Upload Failed") or line:match("Failed to create LittleFS") then
						-- Restore original function on failure
						arduino.append_to_buffer = original_append
						return
					end
				end
			end

			vim.cmd("InoDataUpload")
		end, { desc = "Upload data then compile and upload with monitor for Arduino" })
	end,
}
