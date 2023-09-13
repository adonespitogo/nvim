return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"nvim-telescope/telescope-media-files.nvim",
			dependencies = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
			},
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		--telescope.setup {
		--  defaults = {
		--    mappings = {
		--      n = {
		--        ["q"] = actions.close
		--      },
		--    },
		--  },
		--}
		--
		--keymaps
		--vim.keymap.set('n', ';f',
		--  function()
		--    builtin.find_files({
		--      no_ignore = false,
		--      hidden = true
		--    })
		--  end)
		--vim.keymap.set('n', ';r', function()
		--  builtin.live_grep()
		--end)
		--vim.keymap.set('n', '\\\\', function()
		--  builtin.buffers()
		--end)
		--vim.keymap.set('n', ';t', function()
		--  builtin.help_tags()
		--end)
		--vim.keymap.set('n', ';;', function()
		--  builtin.resume()
		--end)
		--vim.keymap.set('n', ';e', function()
		--  builtin.diagnostics()
		--end)

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
				file_ignore_patterns = {
					"%.git/",
					"node%_modules/.*",
				},
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				["media_files"] = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					-- filetypes = { "png", "webp", "jpg", "jpeg" },
					-- find command (defaults to `fd`)
					-- find_cmd = "rg",
				},
			},
		})

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end)

		vim.keymap.set("n", "<leader>fb", function()
			builtin.buffers({ show_all_buffers = true })
		end)

		vim.keymap.set("n", "<leader>fg", function()
			builtin.live_grep({
				no_ignore = false,
				hidden = true,
			})
		end)

		vim.keymap.set("n", "<leader>fd", function()
			builtin.diagnostics()
		end)

		vim.keymap.set("n", "<leader>fm", function()
			builtin.diagnostics()
			telescope.extensions.media_files.media_files()
		end)

		telescope.load_extension("ui-select")
		telescope.load_extension("media_files")
	end,
}
