" display line numbers
set number

" redefine tab as 4 spaces
set ts=4
set sw=4
set expandtab

" set encoding
set encoding=utf-8

" highlight current line and column
set cursorline
set cursorcolumn

" syntax highlighting
syntax on
syntax enable

" save last cursor position
au BufReadPost *
    \ if line("'\"") > 0 |
    \    if line("'\"") <= line("$") |
    \        exe "norm '\"" |
    \    else |
    \        exe "norm $" |
    \    endif |
    \ endif

" specify a directory for plugins
" - for neovim: ~/.local/share/nvim/plugged
" - avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" make sure you use single quotes

" json support
Plug 'elzr/vim-json'

" go support
Plug 'fatih/vim-go'

" lua support
Plug 'tbastos/vim-lua'

" toml support
Plug 'cespare/vim-toml'

" rust support
" install rust source code with 'rustup component add rust-src'
Plug 'rust-lang/rust.vim'

" nginx.conf support
Plug 'othree/nginx-contrib-vim'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

" highlight several words simultaneously
Plug 'vim-scripts/mark'

" install.py --clang-completer --go-completer --rust-completer
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator'

" show git diff
Plug 'mhinz/vim-signify'

" manage tag files
Plug 'ludovicchabant/vim-gutentags'

" asynchronous fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" initialize plugin system
call plug#end()

" filetype
filetype plugin indent on

" colorscheme
colorscheme gruvbox
set background=dark

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" rust auto format
let g:rustfmt_autosave=1

" YouCompleteMe
let g:ycm_confirm_extra_conf=0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-signify
let g:signify_vcs_list=[ 'git', 'svn' ]

" vim-gutentags
set tags=./.tags;,.tags
" set root directory
let g:gutentags_project_root=[ '.git', '.svn', '.root' ]
" move tag file to '~/.cache/tags'
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_cache_dir=expand('~/.cache/tags')
if !isdirectory('~/.cache/tags')
    silent! call mkdir('~/.cache/tags', 'p')
endif

" LeaderF
let g:Lf_ShortcutF='<c-p>'
nnoremap <leader>fu :LeaderfFunction<CR>
let g:Lf_CommandMap={'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
