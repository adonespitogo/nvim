-- Function to load .goplsrc file
--- @return table|nil
local function load_goplsrc()
	local root_dir = require("utils.golang_root")
	local json = require("dkjson") -- Ensure dkjson is available
	local root = root_dir() -- Get the root directory of the Go project
	if root == nil then
		root = vim.fn.getcwd() -- If the root directory is not found, use the current working directory
	end

	local filepath = root .. "/.goplsrc.json" -- Get the path to the .goplsrc.json file
	local file = io.open(filepath, "r") -- Open the file for reading

	-- If the file does not exist, return an empty table
	if not file then
		return nil
	end

	local content = file:read("*a") -- Read the entire content of the file
	file:close()

	-- Parse JSON content into a Lua table
	local settings, _, err = json.decode(content, 1, nil)

	-- If there’s a JSON parsing error, return an empty table
	if err then
		vim.notify("Error parsing .goplsrc file: " .. err, vim.log.levels.ERROR)
		return nil
	end

	-- Return the parsed settings (table)
	return settings
end

--- @return table|nil
local function load_gopls_env()
	-- Valid "GO_TAGS" format:
	-- (shell) export GO_TAGS="tag1 tag2"
	local gopls = nil
	local flags = os.getenv("GO_TAGS")
	flags = flags and flags or os.getenv("GOTAGS")
	if flags ~= nil and flags ~= "" then
		gopls = { buildFlags = { "-tags=" .. flags } }
	end

	return gopls
end

return function()
	local ok_goplsrc, goplsrc = pcall(load_goplsrc)
	local ok_env, envrc = pcall(load_gopls_env)

	if ok_goplsrc and ok_env and goplsrc ~= nil and envrc ~= nil then
		return vim.tbl_extend("force", goplsrc, envrc)
	end

	return goplsrc or envrc or nil
end
