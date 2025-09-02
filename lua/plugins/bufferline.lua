local map = require("utils.keymap")

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local bufferline = require("bufferline")

		bufferline.setup({
			options = {
				themable = true,
				diagnostics = "nvim_lsp",
				numbers = "ordinal",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		})

		-- Requires transparent.nvim
		-- https://github.com/xiyaowong/transparent.nvim?tab=readme-ov-file#gtransparent_groups
		vim.g.transparent_groups = vim.list_extend(
			vim.g.transparent_groups or {},
			vim.tbl_map(function(v)
				return v.hl_group
			end, vim.tbl_values(require("bufferline.config").highlights))
		)

		-- returns a list of bufnrs in the same order bufferline shows them
		local function bufferline_ordered_bufnrs()
			local ids = {}
			for _, e in ipairs(bufferline.get_elements().elements) do
				table.insert(ids, e.id) -- e has fields like id, path, name, etc.
			end
			return ids
		end

		-- Helper to find the "next" or "previous" buffer
		local function get_adjacent_bufnr(direction)
			local bufs = bufferline_ordered_bufnrs()

			local current = vim.api.nvim_get_current_buf()
			for i, b in ipairs(bufs) do
				if b == current then
					if direction == "next" then
						if bufs[i + 1] then
							return bufs[i + 1]
						else
							return bufs[1] -- Wrap around to the first buffer
						end
					elseif direction == "prev" then
						if bufs[i - 1] then
							return bufs[i - 1]
						else
							return bufs[#bufs] -- Wrap around to the last buffer
						end
					end
				end
			end
			return nil
		end

		local function open_buffer(bufnr, split)
			if not (bufnr and vim.api.nvim_buf_is_valid(bufnr)) then
				return false
			end

			-- Check if buffer is already visible in any window in any tab
			for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
				for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
					if vim.api.nvim_win_get_buf(win) == bufnr then
						-- Switch to tab and window
						vim.api.nvim_set_current_tabpage(tab)
						vim.api.nvim_set_current_win(win)
						return true
					end
				end
			end

			-- Open in "split" or "vsplit" if specified
			if split == "split" or split == "vsplit" then
				vim.cmd(split)
			end
			vim.api.nvim_set_current_buf(bufnr)
			return false
		end

		-- Jump to buffer in another window if it’s already visible
		local function goto_buffer(direction, split)
			local bufnr = get_adjacent_bufnr(direction)
			if not bufnr then
				return
			end

			open_buffer(bufnr, split)
		end

		-- Jump to buffer by index (position in bufferline)
		local function goto_buffer_index(idx, split)
			local bufs = bufferline_ordered_bufnrs()

			if idx < 1 or idx > #bufs then
				-- vim.notify("No buffer " .. idx .. " in this tab. Available buffers: " .. vim.inspect(bufs), vim.log.levels.WARN)
				vim.notify(vim.inspect(vim.t))
				return
			end

			local bufnr = bufs[idx]
			open_buffer(bufnr, split)
		end

		map("n", "<leader>bh", function()
			goto_buffer("prev")
		end, { desc = "Cycle previous buffer" })
		map("n", "<leader>bp", function()
			goto_buffer("prev")
		end, { desc = "Cycle previous buffer" })
		map("n", "<leader>bl", function()
			goto_buffer("next")
		end, { desc = "Cycle next buffer" })
		map("n", "<leader>bn", function()
			goto_buffer("next")
		end, { desc = "Cycle next buffer" })

		map("n", "<leader>bdo", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers except current" })
		map("n", "<leader>bdl", ":BufferLineCloseRight<CR>", { desc = "Close buffers to the right" })
		map("n", "<leader>bdh", ":BufferLineCloseLeft<CR>", { desc = "Close buffers to the left" })
		map("n", "<leader>bmn", ":BufferLineMoveNext<CR>", { desc = "Move buffer to the right" })
		map("n", "<leader>bmp", ":BufferLineMovePrev<CR>", { desc = "Move buffer to the left" })

		for i = 0, 9, 1 do
			-- Go to buffer by leader+number
			map("n", "<leader>b" .. i, function()
				goto_buffer_index(i)
			end, { desc = "Go to buffer " .. i })

			map("n", "<leader>bv" .. i, function()
				goto_buffer_index(i, "vsplit")
			end, { desc = "Go to buffer " .. i .. "in vsplit window" })

			map("n", "<leader>bx" .. i, function()
				goto_buffer_index(i, "split")
			end, { desc = "Go to buffer " .. i .. "in split window" })
		end
	end,
}
