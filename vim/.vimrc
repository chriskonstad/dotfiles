" TODO
" Get YouCompleteMe setup
" YCM-generator?
call plug#begin('~/.vim/plugged')
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jeaye/color_coded'
Plug 'itchyny/lightline.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'def-lkb/ocp-indent-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rust-lang/rust.vim', {'for': ['rust']}
"Plug 'scrooloose/syntastic', {'for': ['ocaml']}
"Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'rhysd/vim-clang-format'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'evansalter/vim-checklist'
Plug 'mhinz/vim-grepper'
Plug 'kshenoy/vim-signature'
Plug 'christoomey/vim-sort-motion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'valloric/youcompleteme'
Plug 'racer-rust/vim-racer'
Plug 'rdnetto/YCM-Generator'
call plug#end()

" OCaml
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"
let g:syntastic_ocaml_checkers = ['merlin']
au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" Rust
let g:ycm_rust_src_path = '/Users/chris/Programming/rustc-1.8.0/src'

" Configure Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

" Auto-create tags for C/C++
autocmd BufLeave *.c,*.cpp normal! mS
autocmd BufLeave *.h,*.hpp normal! mH
autocmd BufLeave makefile,Makefile,CMakeLists.txt normal! mM

autocmd BufEnter *.md,*.tex set spell

" Quickly switch between buffers
:nnoremap <F4> :NERDTreeToggle<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F6> :Tagbar<CR>

" Enable checkbox toggling
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
let g:rbpt_colorpairs = [
    \ ['brown', 'RoyalBlue3'],
    \ ['darkgray', 'DarkOrchid3'],
    \ ['Darkblue', 'SeaGreen3'],
    \ ['darkgreen', 'firebrick3'],
    \ ['darkcyan', 'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred', 'SeaGreen3'],
    \ ['brown', 'firebrick3'],
    \ ['gray', 'RoyalBlue3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['red', 'firebrick3'],
    \ ]

" Configure rainbow parentheses
au VimEnter * RainbowParenthesesToggleAll

" Configure multiple cursors
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0

" GCC Syntastic code
" let g:syntastic_c_checker_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
autocmd! BufWritePost * Neomake

" Add clang formatting support
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <C-f> :ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <C-f> :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>F :ClangFormatAutoToggle<CR>

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

" Make Ctrlp use ag if possible
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Setup the MatchTagsAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml': 1,
    \ 'xml' : 1,
    \ 'php' : 1,
    \}

" Basic settings
set nocompatible
set shell=bash
set fileformats=unix
set ignorecase
set smartcase
set cursorline
set hidden

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
syntax enable
set background=dark
colorscheme solarized
set display+=lastline

" Set up tabs and whitespace display
set autoindent
set expandtab
set list listchars=tab:»·,trail:·
set shiftwidth=2
set tabstop=2

" Moving Around
" Treat long lines as break lines
map j gj
map k gk

" Fix ctrl-c differences from esc
map  <Esc>
map!  <Esc>
imap jk <Esc>

" Set up the color column
set colorcolumn=80

let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
    " Set the color scheme for the popup menu
    highlight Pmenu ctermfg=black ctermbg=lightblue
    highlight PmenuSel ctermfg=black ctermbg=lightgreen

    " Set the highlight color scheme
    highlight Visual ctermfg=lightblue ctermbg=white
endif

" Setup backup directory
if has("vms")
    set nobackup " user versions instead
else
    set backup
    set backupdir=~/.vimbackup
endif

set ruler

" Set up the clipboard, at least on osx
set clipboard=unnamed
