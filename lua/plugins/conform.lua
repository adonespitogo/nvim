return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters = {
                css = { "prettier" },
                eruby = { "htmlbeautifier" },
                markdown = { "typos", "mdformat" },
                html = { "htmlbeautifier" },
                javascript = { "prettier" },
                json = { "fixjson" },
                lua = { "stylua" },
                proto = { "buf" },
                sh = { "beautysh" },
                sql = { "pg_format" },
                templ = { "htmlbeautifier", "templ" },
                typescript = { "prettier" },
                vue = { "prettier" },
                yaml = { "yamlfix", "yamlfmt" },
                terraform = { "terraform_fmt" },
            },
        })
    end,
}
