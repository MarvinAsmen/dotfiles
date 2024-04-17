return {
    -- ### FILE EXPLORER
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            renderer = {
                root_folder_modifier = ":t",
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                icons = {
                    hint = "󰌵",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            view = {
                width = 40,
                side = "left",
            },
        },
        keys = {
            {
                "<leader>e",
                ":NvimTreeToggle<CR>",
                desc = "Open File Explorer"
            },
        },
    },

    -- ### TABLINE ###
    {'romgrk/barbar.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = false,
            modified = {button = ''},
            icons = {
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
                    [vim.diagnostic.severity.WARN] = {enabled = true, icon = ' '},
                    [vim.diagnostic.severity.INFO] = {enabled = false, icon = ' '},
                    [vim.diagnostic.severity.HINT] = {enabled = false, icon = '󰌵 '},
                },
            },
            sidebar_filetypes = {
                NvimTree = true,
            },
        },
    },

    -- ### TELESCOPE ###
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {"<leader>ff", ":Telescope find_files<CR>", desc = "Find files"},
            {"<leader>fg", ":Telescope live_grep<CR>", desc = "Live grep"},
            {"<leader>fb", ":Telescope buffers<CR>", desc = "Buffers"},
            {"<leader>fv", ":Telescope treesitter<CR>", desc = "Buffers"},
            {"<leader>fd", ":Telescope diagnostics<CR>", desc = "Diagnostics"},

            {"<leader>gb", ":Telescope git_branches<CR>", desc = "Git branch"},
            {"<leader>gs", ":Telescope git_status<CR>", desc = "Git status"},
            {"<leader>gc", ":Telescope git_commits<CR>", desc = "Git commits"},

        },
    },

    {
        "aznhe21/actions-preview.nvim",
        config = function ()
            vim.keymap.set({ "v", "n" }, "<leader>.", require("actions-preview").code_actions)
        end
    },


    -- ### REMEMBER LAST POSITION ###
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require("nvim-lastplace").setup({
                lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
                lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
                lastplace_open_folds = true
            })
        end,
    },

    -- ### VIM & TMUX SPLIT NAVIAGTION ###
    {
        "christoomey/vim-tmux-navigator",
    },
}
