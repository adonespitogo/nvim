-- Add author header to file

-----------------------------------------------------------
-- Author Header
-----------------------------------------------------------

local g = vim.g -- Global variables

g.header_field_author = "Adones Pitogo"
g.header_field_author_email = "adonesp@flarego.ph"
g.header_field_modified_by = 0
g.header_field_timestamp_format = "%b %d, %Y"

local start_year = "2021"
local current_year = os.date("%Y")
local end_year = current_year == start_year and "" or ("-" .. current_year)
g.header_field_copyright = "Copyright " .. start_year .. end_year .. " Flarego Technologies Corp. <business@flarego.ph>"


return {
	"alpertuna/vim-header",
	config = function()
		local map = require("utils.keymap")
		map("n", "<F4>", ":AddHeader<CR>", { desc = "Add author header to file" })
	end,
}
