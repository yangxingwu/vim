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

" tagbar
Plug 'majutsushi/tagbar'

" show git diff
Plug 'mhinz/vim-signify'

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

" tagbar
let g:tagbar_sort=0
let g:tagbar_compact=1
let g:tagbar_foldlevel=1
let g:tagbar_iconchars=['+', '-']
nnoremap <silent> <F9> :TagbarToggle<CR>
autocmd VimEnter * nested :call tagbar#autoopen(1)

" vim-signify
let g:signify_vcs_list = [ 'git', 'svn' ]
