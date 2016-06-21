set nu
set ts=8
set sw=8
set t_Co=256
set hlsearch
set noexpandtab
set autoindent
set smartindent
set laststatus=2

" Jump to the last cursor position
au BufReadPost *
    \ if line("'\"") > 0 |
    \    if line("'\"") <= line("$") |
    \        exe "norm '\"" |
    \    else |
    \        exe "norm $" |
    \    endif |
    \ endif

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mark'
Plugin 'a.vim'
Plugin 'taglist.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-utils/vim-man'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

" Solarized color scheme
syntax enable
" set background=dark
" colorscheme solarized

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'


" Taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Sort_Type="name"
" map <silent> <F7> :TlistToggle<cr>

" YouCompleteMe
" let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf=0
" let g:loaded_youcompleteme=1 " Disable YouCompleteMe

" line length 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
