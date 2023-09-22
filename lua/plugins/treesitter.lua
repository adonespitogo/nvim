return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        local nvim_treesitter = require("nvim-treesitter.configs")
        nvim_treesitter.setup({
            -- Disable autocmd for commentstring
            -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#plugins-with-a-pre-comment-hook
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
            },

            -- A list of parser names, or "all"
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "html",
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
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            highlight = {
                -- `false` will disable the whole extension
                enable = true,
            },
        })

        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
    end,
}
