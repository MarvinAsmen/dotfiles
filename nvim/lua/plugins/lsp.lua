return {
    -- ### LANGUAGE SERVER MANAGER ###
    {
        "williamboman/mason.nvim",
        config = function()
            local lsp_zero = require('lsp-zero')
            require('mason').setup({})
            require('mason-lspconfig').setup({
                handlers = {
                    lsp_zero.default_setup,
                },
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
    },

    -- ### LSP ###
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v3.x',
        lazy = true,
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            lsp_zero.set_sign_icons({
                error = '',
                warn = '',
                hint = '󰌵',
                info = ''
            })

            -- ESLINT: Fix all on save
            local eslint = require('lspconfig').eslint
            eslint.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {"hrsh7th/cmp-nvim-lsp"},
        },
        config = function ()
            vim.diagnostic.config({
                virtual_text = false,
            })
        end
    },

    -- ### AUTOCOMPLETE ###
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {"L3MON4D3/LuaSnip"},
        },
        config = function()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
              mapping = cmp.mapping.preset.insert({
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({select = false}),

                -- Ctrl+Space to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),

                -- Navigate between snippet placeholder
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                -- Scroll up and down in the completion documentation
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
              })
            })
        end,
    },
}

