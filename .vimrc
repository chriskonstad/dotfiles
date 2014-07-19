set nocompatible
set shell=bash
set fileformats=unix
set ignorecase

set backspace=eol,start,indent

" Set up the window
filetype plugin indent on
syntax on
set hls
set laststatus=2
set mouse=a
set number
set relativenumber
set wildmenu

" Set up tabs and whitespace display
set autoindent
set expandtab
set list listchars=tab:»·,trail:·
set shiftwidth=4
set tabstop=4

" Set up the color column
set textwidth=79
set colorcolumn=80

" Setup backup directory
if has("vms")
    set nobackup " user versions instead
else
    set backup
    set backupdir=~/.vimbackup
endif

set ruler

" Install pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

" Quickly switch between buffers
:nnoremap <F5> :buffers<CR>:buffer<Space>

" Configure rainbow parentheses
au VimEnter * RainbowParenthesesToggleAll

" Configure multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" GCC Syntastic code
" let g:syntastic_c_checker_header = 1

set tags=./tags;$HOME   " auto-find tags, up to home if sub directory

" force syntax highlighting
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.ts set filetype=javascript

" Setup YouCompleteMe
let g:ycm_extra_conf_globalist = ['~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
au BufRead,BufNewFile *.cpp let g:ycm_show_diagnostics_ui = 0
