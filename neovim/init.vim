" specify a directory for plugins
" - for neovim: ~/.local/share/nvim/plugged
" - avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" make sure you use single quotes

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

" initialize plugin system
call plug#end()

" colorscheme
colorscheme gruvbox
set background=dark

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
