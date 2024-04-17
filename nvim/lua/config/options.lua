-- # Variable to avoid writing vim.opt.<option> every time
local o = vim.o



-- # Type ":help options" to get details about the options

-- ## Editor
o.clipboard = "unnamedplus"	        -- allow nvim to access system clipboard
o.mouse = "a"					    -- allows mouse support in nvim
o.conceallevel = 0 					-- so that `` is visible in markdown files
o.splitbelow = true					-- force all horizontal splits to go below current window
o.splitright = true					-- force all vertical splits to go to the right of current window
o.timeoutlen = 1000					-- time to wait for a mapped sequence to complete (in ms)
o.updatetime = 300					-- faster completion (4000ms default)
o.expandtab = true					-- convert tabs to spaces
o.shiftwidth = 4					-- the number of spaces inserted for each indentation
o.tabstop = 4					    -- insert 2 spaces for a tab
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = false                -- disable folding everything at the start

-- ## Visuals
o.termguicolors = true			    -- set terminal gui colors
o.number = true 					-- show line numbers
o.relativenumber = true		        -- enable relative numbered lines
o.laststatus = 2					-- always display status line
o.showmode = false					-- don't show mode information like -- INSERT --
o.cmdheigth = 2						-- more space in nvim command line (for displaying messages)
o.pumheight = 10					-- pop up menu height
o.showtabline = 2					-- always show tabs
o.cursorline = true					-- highlight the current line
o.wrap = false						-- display lines as one long line
o.signcolumn = "yes"				-- always show the sign column, otherwise it would shift the text each time
o.scrolloff = 8						-- scroll offset lines abov and below cursor
o.sidescrolloff = 8					-- numbers of spaces besode cursor

-- ## Files
o.fileencoding = "utf-8"	 	    -- the encoding written to a file
o.swapfile = false 					-- create no swap file
o.backup = false 					-- create no backup file
o.writebackup = false 			    -- file must not be edited if another programm is accessing it
o.undofile = true					-- enable persistent undo

-- ## Search
o.hlsearch = false					-- don't highlight all matches on previous search pattern
o.ignorecase = true					-- ignore case in search patterns
o.smartcase = true					-- enable smart case
o.smartindent = true				-- make indenting smarter


vim.cmd([[highlight EndOfBuffer ctermfg=black ctermbg=black]])
