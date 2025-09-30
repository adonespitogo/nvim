local function get_lua_version()
	local ver = _VERSION or ""
	local major, minor = ver:match("Lua (%d+)%.(%d+)")
	if major and minor then
		return major .. "." .. minor
	end
	return nil
end

local lua_version = get_lua_version()

return {
	"vhyrro/luarocks.nvim",
	priority = 1000, -- luarocks.nvim should run first
	opts = {
		rocks = { "luacheck", "dkjson", "jsregexp" },
		luarocks_build_args = lua_version and { "--lua-version=" .. lua_version } or {},
	},
}
