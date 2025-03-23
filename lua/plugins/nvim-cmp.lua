-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp

return {
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        -- "hrsh7th/cmp-nvim-lsp",
        -- "hrsh7th/cmp-buffer",
        { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
        { "iguanacucumber/mag-buffer",   name = "cmp-buffer" },
        { "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
        { "iguanacucumber/mag-cmdline",  name = "cmp-cmdline" },
        -- "hrsh7th/cmp-path",
        "https://codeberg.org/FelipeLema/cmp-async-path",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "rasulomaroff/cmp-bufname",
        "SergioRibera/cmp-dotenv",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        local icons = {
            Class = "󰠱",
            Constructor = "",
            Constant = "",
            Copilot = "",
            Enum = "",
            Event = "",
            Field = "",
            File = "",
            Folder = "",
            Function = "󰊕",
            Interface = "",
            Keyword = "",
            Method = "󰊕",
            Module = "",
            Operator = "",
            Property = "",
            Snippet = "",
            Struct = "",
            Text = "󰊄",
            TypeParameter = "",
            Unit = "󰖡",
            Value = "",
            Variable = "󱄑",
        }

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' }
                    }
                }
            })
        })

        cmp.setup({
            -- Load sources, see: https://github.com/topics/nvim-cmp
            sources = {
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = 'nvim_lua' },
                { name = "luasnip" },
                { name = "path" },
                { name = "buffer" },
                { name = "bufname" },
                { name = "dotenv" },
                { name = "nvim_lsp_signature_help" },
                {
                    name = "html-css",
                    option = {
                        enable_on = { "html", "vue", "ejs", "pug", "eruby", "haml" },
                        enable_file_patterns = { "*.html", "*.erb" },
                        file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
                        style_sheets = {
                            -- example of remote styles, only css no js for now
                            -- "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",

                            -- TODO: try load file when offline
                            -- "file://"
                            -- .. nvim_config_path
                            -- .. "/assets/bootstrap-v5.3.0.min.css",
                        },
                    },
                },
            },
            -- Window styles
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            formatting = {
                -- format = lspkind.cmp_format(),
                format = function(entry, vim_item)
                    if not vim_item then
                        return ""
                    end

                    local kind = vim_item.kind
                    if not kind then
                        return ""
                    end

                    vim_item.kind = (icons[kind] or "") .. " " .. vim_item.kind

                    local source = entry.source.name

                    if entry.source.name == "html-css" then
                        vim_item.menu = entry.completion_item.menu
                        return vim_item
                    end

                    vim_item.menu = "[" .. source .. "]"
                    return vim_item
                end,
            },
            -- Completion settings
            completion = {
                --completeopt = 'menu,menuone,noselect'
                keyword_length = 1,
            },
            experimental = {
                ghost_text = true,
            },
            -- Key mapping
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                ["<C-j>"] = cmp.mapping.scroll_docs(4),
                ["<C-l>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                ["<CR>"] = cmp.mapping(function(fallback)
                    local do_select = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    })

                    if cmp.get_selected_entry() then
                        do_select()
                    else
                        fallback()
                    end
                end),

                -- Tab mapping
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end),
            },
        })
    end,
}
