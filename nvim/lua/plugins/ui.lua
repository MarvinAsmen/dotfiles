return {
    -- ### COLORSCHEME ###
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_style = "andromeda"
            vim.g.sonokai_enable_italic = 1
            vim.g.sonokai_current_word = "underline"
            vim.g.sonokai_better_performance = 1 -- Lazy loading
            vim.g.sonokai_show_eob = 0 -- Hide ~ at Buffer end
            vim.g.sonokai_diagnostic_virtual_text = "highlighted"

            vim.cmd([[let g:sonokai_colors_override = {'bg3': ['#585b64', '237']}]])  -- change highlighting color

            vim.cmd.colorscheme("sonokai")
        end,
    },

    -- ### STATUSLINE / TABLINE ###
    {
        "itchyny/lightline.vim",
        lazy = false,
        config = function()
            vim.g.lightline = {
              colorscheme = "sonokai",
              enable = {
                statusline = 1,
                tabline = 0,
              }
            }
        end,
    },

    -- ### NOTIFICATION ###
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            local notify = require("notify").async
        end,
    },

    -- ### INDENTATION LINES ###
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
}
