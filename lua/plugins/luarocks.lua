local function get_lua_incdir()
	if vim.loop.os_uname().sysname ~= "Linux" then
		return nil
	end

	-- Prefer LuaJIT for Neovim
	if vim.loop.fs_stat("/usr/include/luajit-2.1") then
		return "/usr/include/luajit-2.1"
	end

	-- Fallback: Lua 5.1
	if vim.loop.fs_stat("/usr/include/lua5.1") then
		return "/usr/include/lua5.1"
	end

	-- No match, error out
	return "/usr/include" -- but this is 5.4 (will fail)
end

return {
	"adonespitogo/luarocks.nvim",
	name = "luarocks.nvim",
	-- dir = "/home/adonesp/Projects/luarocks.nvim",
	priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
	opts = {
		rocks = { "luacheck", "dkjson", "jsregexp" }, -- specifies a list of rocks to install
		luarocks_install_args = (vim.loop.os_uname().sysname == "Linux") and {
			"LUA_INCDIR=" .. get_lua_incdir(),
		} or nil,
	},
}
