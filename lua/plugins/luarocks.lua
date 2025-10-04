local function get_lua_version()
	local ver = _VERSION or ""
	local major, minor = ver:match("Lua (%d+)%.(%d+)")
	if major and minor then
		return major .. "." .. minor
	end
	return nil
end

local function is_linux()
  local uname_output = vim.fn.system('uname -s'):gsub('%s+', '') -- Remove whitespace
  return uname_output == 'Linux'
end

local lua_version = get_lua_version()
print("Lua version: " .. lua_version)

local build_args = is_linux() and { "--lua-version=" .. lua_version } or {}
local install_args = is_linux() and { "--lua-version=" .. lua_version, "LUA_INCDIR=/usr/include/luajit-2.1" } or {}
local branch = is_linux() and "main" or "macos"

return {
	"adonespitogo/luarocks.nvim",
  -- branch = "fix/luarocks",
  branch = branch,
	priority = 1000, -- luarocks.nvim should run first
	opts = {
		rocks = { "luacheck", "dkjson", "jsregexp" },
		luarocks_build_args = build_args,
		luarocks_install_args = install_args,
	},
}
