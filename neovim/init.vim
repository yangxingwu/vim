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

" yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

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
Plug 'dracula/vim', { 'as': 'dracula' }

" highlight several words simultaneously
Plug 'vim-scripts/mark'

" python3 ./install.py --clangd-completer --go-completer
Plug 'ycm-core/YouCompleteMe'

" show git diff
Plug 'mhinz/vim-signify'

" manage tag files
Plug 'ludovicchabant/vim-gutentags'

" asynchronous fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" auto-completion for quotes, parens, brackets, etc
Plug 'Raimondi/delimitMate'

" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
" checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you
" edit your text files, and acts as a Vim Language Server Protocol client
Plug 'dense-analysis/ale'

" initialize plugin system
call plug#end()

" filetype
filetype plugin indent on

" colorscheme
colorscheme dracula
set background=dark

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" rust auto format
let g:rustfmt_autosave=1

" YouCompleteMe
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1

" vim-signify
let g:signify_vcs_list=[ 'git', 'svn' ]

" vim-gutentags
set tags=./.tags;,.tags
let g:gutentags_ctags_extra_args=['--fields=+l']
" set root directory
let g:gutentags_project_root=[ '.git', '.svn', '.root' ]
" move tag file to '~/.cache/tags'
let g:gutentags_ctags_tagfile='.tags'
let g:gutentags_cache_dir=expand($HOME) . '/.cache/tags'
if !isdirectory(g:gutentags_cache_dir)
    silent! call mkdir(g:gutentags_cache_dir, 'p')
endif

" LeaderF
let g:Lf_ShortcutF='<c-p>'
nnoremap <leader>fu :LeaderfFunction<CR>
let g:Lf_CommandMap={'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}
let g:Lf_Ctags='/usr/local/bin/ctags'

" vim-go
let g:go_version_warning=0

set maxmempattern=5000

" ale
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit=1
" Enable Lint only for bash.
let g:ale_linters={
\   'sh': ['shellcheck'],
\   'python': ['pylint'],
\}
" Enbale fixers for python
let g:ale_fixers={
\   'python': ['black', 'isort']
\}

" linux kernel coding style
"
" this code is meant to help you respecting the Linux kernel coding style,
" described at: http://www.kernel.org/doc/Documentation/CodingStyle
"
" pls see https://github.com/vivien/vim-linux-coding-style for more details
"
" enable the coding style on demand with cmd ': LinuxCodingStyle'

command! LinuxCodingStyle call s:LinuxCodingStyle()

function! s:LinuxCodingStyle()
    call s:LinuxFormatting()
    call s:LinuxKeywords()
    call s:LinuxHighlighting()
endfunction

function s:LinuxFormatting()
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
    setlocal textwidth=80
    setlocal noexpandtab

    setlocal cindent
    setlocal cinoptions=:0,l1,t0,g0,(0
endfunction

function s:LinuxKeywords()
    syn keyword cOperator likely unlikely
    syn keyword cType u8 u16 u32 u64 s8 s16 s32 s64
    syn keyword cType __u8 __u16 __u32 __u64 __s8 __s16 __s32 __s64
endfunction

function s:LinuxHighlighting()
    highlight default link LinuxError ErrorMsg

    syn match LinuxError / \+\ze\t/     " spaces before tab
    syn match LinuxError /\%>80v[^()\{\}\[\]<>]\+/ " virtual column 81 and more

    " Highlight trailing whitespace, unless we're in insert mode and the
    " cursor's placed right after the whitespace. This prevents us from having
    " to put up with whitespace being highlighted in the middle of typing
    " something
    autocmd InsertEnter * match LinuxError /\s\+\%#\@<!$/
    autocmd InsertLeave * match LinuxError /\s\+$/
endfunction
