-- provides :Bdelete

vim.api.nvim_set_keymap("n", "<leader>qq", ":Bdelete<CR>", { noremap = true, silent = true })

return {
	"moll/vim-bbye",
}
