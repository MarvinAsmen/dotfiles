" ============================================================================ "
" ===                           PLUGINS                                    === "
" ============================================================================ "
call plug#begin('~/.config/nvim/plugged')

" === THEMES === "
Plug 'sainnhe/sonokai' 			                    		" - High Contrast & Vivid Color Scheme
Plug 'itchyny/lightline.vim' 			                	" - Configurable statusline/tabline

" === FILE AND FOLDER MANAGEMENT === "
Plug 'mcchrish/nnn.vim'                             " - NNN in Vim
Plug 'preservim/nerdtree'                           " - File system explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " - Adds icons to nerdtree
Plug 'junegunn/fzf.vim'                             " - Search for files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plug 'preservim/tagbar' 				                    " - Get an overview of file structure/tags

" === LANGUAGE SUPPORT === "
Plug 'neoclide/coc.nvim', {'branch': 'release'} 	  " - Nodejs extension
Plug 'sheerun/vim-polyglot' 				                " - Collection of language packs 
Plug 'vim-syntastic/syntastic' 				              " - Syntax checker

" === SNIPPETS === "
Plug 'SirVer/ultisnips'                             " - Snippets in Vim
Plug 'honza/vim-snippets'                           " - Snippets files for various programming languages
Plug 'natebosch/dartlang-snippets'                  " - Collection of snippets for writing Dart

" === CODE STYLE === "
Plug 'jiangmiao/auto-pairs'			                  	" - Insert or delete brackets, parens, quotes in pair. 

" === LATEX === "
Plug 'lervag/vimtex'                                " - Latex support

" === OTHER === "
Plug 'farmergreg/vim-lastplace'                     " - Remember last position

call plug#end()



" ============================================================================ "
" ===                           THEMES                                     === "
" ============================================================================ "
if has('termguicolors')
    set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1

colorscheme sonokai

let g:lightline = {}
let g:lightline.colorscheme = 'sonokai'



" ============================================================================ "
" ===                           SETTINGS                                   === "
" ============================================================================ "
syntax on                       " - Enable Syntax
set number            					" - Display line number
set visualbell                  " - Disable beep sound
set encoding=utf-8              " - Default file encoding
set wrap                        " - Line wrap
set laststatus=2                " - Always display statusline
set hlsearch                    " - Highlight all search matches
set incsearch                   " - Enable incremential search
set autoindent                  " - Enable automatic indent
set smartindent                 " - Enable smartindent
set t_Co=256                    " - 256 colors in vim
set nobackup                    " - Disable backup
set nowritebackup               " - Disable backup
set mouse=a                     " - Enable mouse support
set updatetime=300              " - Improve performance
set cmdheight=1                 " - Height of the command line area
set shortmess+=c                " - Don't give ins-completion-menu messages
set signcolumn=number           " - Show sign column all the time
set clipboard=unnamed           " - Copy to Clipboard
set rtp+=/usr/local/opt/fzf     " - Fzf in runtimepath
                                " -Use ripgrep as grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow 



" ============================================================================ "
" ===                           MAPPING                                    === "
" ============================================================================ "
" === VIM === "
let mapleader=" "
nmap <c-c> <esc>
imap <c-c> <esc>
vmap <c-c> <esc>
omap <c-c> <esc>

" === Nerdtree === "
nnoremap <C-b> :NERDTreeToggle<CR>

" === Tagbar === "
nmap <F8> :TagbarToggle<CR>

" === NNN === "
nmap <F7> :NnnPicker %:p:h<CR>

" === FZF === "
nnoremap <silent> <C-p> :Files<CR>  
nnoremap <silent> <C-g> :Rg<CR>

" === COC === "
" > Completion
inoremap <silent><expr> <c-space> coc#refresh()
" > Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" > Documentation
nnoremap <silent> gh :call <SID>show_documentation()<CR>
" > Rename
nmap <F2> <Plug>(coc-rename)
" > List
nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>
nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <leader>cx  :<C-u>CocList extensions<cr>
" > Format
nmap <leader>cf  <Plug>(coc-format-selected)
vmap <leader>cf  <Plug>(coc-format-selected)
" > Code Action
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
" > Snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)



" ============================================================================ "
" ===                           NNN                                        === "
" ============================================================================ "
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-s>': 'split',
      \ '<c-v>': 'vsplit' }
let g:nnn#session = 'local'      " - use the same n³ session within a vim session



" ============================================================================ "
" ===                           VIMTEX                                     === "
" ============================================================================ "
let g:vimtex_compiler_engine = 'lualatex'
let g:vimtex_view_method = 'skim'


  
" ============================================================================ "
" ===                             COC SETUP                                === "
" ============================================================================ "
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-java',
            \ 'coc-vimtex',
            \ 'coc-flutter',
            \ 'coc-yaml',
            \ ]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
