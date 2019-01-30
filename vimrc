set nu
set ts=4
set sw=4
set t_Co=256
set hlsearch
set expandtab
set autoindent
set smartindent
set laststatus=2
set encoding=utf-8

" make backspace work like most other apps
set backspace=2

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
Plugin 'tomasr/molokai'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin 'mark'
Plugin 'a.vim'
Plugin 'taglist.vim'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-utils/vim-man'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Shirk/vim-gas'
call vundle#end()            " required
filetype plugin indent on    " required

" Color schemes:
" solarized, molokai, Tomorrow, Tomorrow-Night, Tomorrow-Night-Eighties
syntax enable
set background=dark
colorscheme Tomorrow-Night

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

" Tagbar
let g:tagbar_left=1
nnoremap <silent> <F9> :TagbarToggle<CR>

" YouCompleteMe
set completeopt-=preview
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:loaded_youcompleteme=1 " Disable YouCompleteMe
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_extensions = ['funky']

" line length 80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

ca Ag Ag!
ca AgBuffer AgBuffer!

" for macvim
if has("gui_macvim")
    set gfn=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h14
endif

" markdown
let g:vim_markdown_folding_disabled = 1

" nginx.conf
au BufRead,BufNewFile ~/repos/nginx_lb_conf/* if &ft == '' | setfiletype nginx | endif
