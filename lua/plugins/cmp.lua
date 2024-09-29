return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        "hrsh7th/cmp-buffer",
        'hrsh7th/cmp-path',
        { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',
        -- 'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        require('luasnip.loaders.from_vscode').lazy_load()


        luasnip.config.setup {}


        cmp.setup {
            completion = { completeopt = 'menu,menuone,preview,noinsert' },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                ['<C-y>'] = cmp.mapping.confirm { select = true },
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<Tab>'] = cmp.mapping.confirm { select = true },
                ['<C-c>'] = cmp.mapping.abort(),

                ['<C-Space>'] = cmp.mapping.complete({}),
            },

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            })
        }
    end,
}

