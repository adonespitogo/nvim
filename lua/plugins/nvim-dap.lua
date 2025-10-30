local map = require("utils.keymap")
local get_root_dir = require("utils.root-dir")
local ls_dir = require("utils.ls-dir")

return {
	"mfussenegger/nvim-dap",
	config = function()
		local widgets = require("dap.ui.widgets")
		local sidebar = widgets.sidebar(widgets.scopes)

		map("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle dap breakpoint" })
		map("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Dap continue" })
		map("n", "<leader>du", function()
			sidebar.open()
		end, { desc = "Show dap sidebar" })

		map("n", "<leader>dx", function()
			sidebar.close()
		end, { desc = "Hide dap sidebar" })

		local dap = require("dap")
		dap.adapters.coreclr = {
			type = "executable",
			command = "netcoredbg",
			args = { "--interpreter=vscode" },
		}

		dap.adapters.ruby = {
			type = "executable",
			command = "rdbg",
			args = { "-n" }, -- Specify the no-wait option
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				env = "ASPNETCORE_ENVIRONMENT=Development",
				args = {
					"/p:EnvironmentName=Development", -- this is a msbuild jk
					--  this is set via environment variable ASPNETCORE_ENVIRONMENT=Development
					"--urls=http://localhost:5002",
					"--environment=Development",
				},
				program = function()
					-- return vim.fn.getcwd() .. "/bin/Debug/net8.0/FlareHotspotServer.dll"
					local files = ls_dir(get_root_dir() .. "/bin/Debug/")
					if #files == 1 then
						local dotnet_dir = get_root_dir() .. "/bin/Debug/" .. files[1]
						files = ls_dir(dotnet_dir)
						for _, file in ipairs(files) do
							if file:match(".*%.dll") then
								return dotnet_dir .. "/" .. file
							end
						end
					end
					-- return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
					return vim.fn.input({
						prompt = "Path to dll",
						default = get_root_dir() .. "/bin/Debug/",
					})
				end,
			},
		}

		dap.configurations.ruby = {
			{
				type = "ruby",
				name = "Attach with rdbg (Docker)",
				request = "attach",
				remote_path = "/rails", -- The project path *inside* the container
				host = "127.0.0.1", -- Or your Docker machine IP
				port = 12345, -- The port exposed from Docker
				local_path = "${workspaceFolder}", -- Your local project root
			},
		}
	end,
}
