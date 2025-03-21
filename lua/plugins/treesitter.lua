return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        local nvim_treesitter = require("nvim-treesitter.configs")
        local text_objects = require("utils.treesitter.treesitter-text-objects")
        nvim_treesitter.setup({
            textobjects = text_objects,

            -- Install parsers synchronously (only applied to `ensure_installed`)
            auto_install = true,
            ignore_install = {},
            modules = {},
            sync_install = false,
            highlight = {
                enable = true,
            },
            indent = true,

            -- A list of parser names, or "all"
            ensure_installed = {
                "vimdoc",
                "bash",
                "c",
                "cpp",
                "c_sharp",
                "css",
                "html",
                "markdown",
                "markdown_inline",
                "javascript",
                "json",
                "lua",
                "python",
                "rust",
                "typescript",
                "vim",
                "yaml",
                "go",
                "php",
                "vue",
                "pug",
                "templ",
                "terraform",
                "proto",
                "embedded_template",
                "sql",
            },
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end,
}
