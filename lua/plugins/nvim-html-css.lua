return {
    "Jezda1337/nvim-html-css",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
        "sharkdp/fd",
    },
    config = function()
        require("html-css"):setup({})
    end,
}
