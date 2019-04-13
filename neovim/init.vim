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

" nginx.conf support
Plug 'othree/nginx-contrib-vim'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

" highlight several words simultaneously
Plug 'vim-scripts/mark'

" initialize plugin system
call plug#end()

" colorscheme
syntax enable
colorscheme gruvbox
set background=dark

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
