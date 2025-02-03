return {
	"L3MON4D3/LuaSnip",
	version = "2.*",
	build = "make install_jsregexp",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		-- LuaSnip Snippet History Fix (Seems to work really well, I think.)
		local ls = require("luasnip")
		local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })

		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "*",
			callback = function()
				if
					((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
					and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
					and not ls.session.jump_active
				then
					ls.unlink_current()
				end
			end,
			group = luasnip_fix_augroup,
		})

		require("luasnip.loaders.from_vscode").lazy_load({
			"./snippets",
		})

		ls.filetype_extend("ruby", { "rails" })
	end,
}
