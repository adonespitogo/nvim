return {
	"vhyrro/luarocks.nvim",
	priority = 1000, -- luarocks.nvim should run first
	opts = {
		rocks = { "luacheck", "dkjson", "jsregexp" },
	},
}
