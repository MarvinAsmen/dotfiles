return {
    -- ### AUTOCLOSE ###
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true, -- treesitter integration
            disable_filetype = { "TelescopePrompt" },
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        },
        init = function()
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
        end,
    },

    {
        "windwp/nvim-ts-autotag",
    },

    -- ### COMMENTING ###
    {
        "numToStr/Comment.nvim",
        keys = {
            {
                "<leader>/",
                "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
                desc = "Comment line"
            },
            {
                "<leader>/",
                '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
                mode = "x",
                desc = "Comment line"
            },
        },
    },

    -- ### IMPROVED CODE HIGHLIGHTING ###
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                autotag = { enable = true },
            })
        end,
    },

    -- ### COLORED COLOR CODES ###
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- ### AUTO DETECT INDENTATION ###
    {
        "nmac427/guess-indent.nvim",
        config = function ()
            require('guess-indent').setup()
        end
    },
}
