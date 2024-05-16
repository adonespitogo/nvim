return {
	"b0o/incline.nvim",
	config = function()
		local devicons = require("nvim-web-devicons")

		require("incline").setup({
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified

				local function has_diagnostics(severity)
					local n =
						#vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
					return n > 0
				end

				local has_errors = has_diagnostics("error")

				if modified then
					ft_icon = ""
					ft_color = "yellowgreen"
				end

				if has_errors then
					ft_icon = ""
					ft_color = "red"
				end

				local function get_filename_text()
					if has_errors then
						return {
							filename .. " ",
							guifg = "red",
							gui = modified and "bold,italic" or "bold",
						}
					elseif has_diagnostics("warning") then
						return {
							filename .. " ",
							guifg = "yellow",
							gui = modified and "bold,italic" or "bold",
						}
					else
						return {
							filename .. " ",
							gui = modified and "bold,italic" or "bold",
						}
					end
				end

				return {
					{ (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
					get_filename_text(),
					{ "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
				}
			end,
		})
	end,
}
