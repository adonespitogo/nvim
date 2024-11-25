local root_dir = require("utils.golang_root")
local json = require("dkjson") -- Ensure dkjson is available

-- Function to load .goplsrc file
local function load_goplsrc()
	local filepath = root_dir() .. "/.goplsrc.json" -- Get the path to the .goplsrc.json file
	local file = io.open(filepath, "r") -- Open the file for reading

	-- If the file does not exist, return an empty table
	if not file then
		return {}
	end

	local content = file:read("*a") -- Read the entire content of the file
	file:close()

	-- Parse JSON content into a Lua table
	local settings, _, err = json.decode(content, 1, nil)

	-- If there’s a JSON parsing error, return an empty table
	if err then
		vim.notify("Error parsing .goplsrc file: " .. err, vim.log.levels.ERROR)
		return {}
	end

	-- Return the parsed settings (table)
	return settings
end

local function load_gopls_env()
	-- Valid "GO_TAGS" format:
	-- (shell) export GO_TAGS="tag1 tag2"
	local gopls = {}
	local flags = os.getenv("GO_TAGS")
	if flags ~= nil and flags ~= "" then
		gopls = { buildFlags = { "-tags=" .. flags } }
	end

	return gopls
end

return function()
	local goplsrc = load_goplsrc()
	local envrc = load_gopls_env()

	return vim.tbl_extend("force", goplsrc, envrc)
end