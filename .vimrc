set nocompatible
set shell=bash
set fileformats=unix
set ignorecase
set smartcase
set cursorline

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

" Configure Lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ }

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

" Auto-create tags for C/C++
autocmd BufLeave *.c,*.cpp normal! mS
autocmd BufLeave *.h,*.hpp normal! mH
autocmd BufLeave makefile,Makefile,CMakeLists.txt normal! mM

autocmd BufEnter *.md,*.tex set spell

" Fix ctrl-c differences from esc
map  <Esc>
map!  <Esc>
imap jk <Esc>

" Set up the color column
"set textwidth=79
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

" Install pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags

" Quickly switch between buffers
:nnoremap <F4> :NERDTreeToggle<CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>
:nnoremap <F6> :Tagbar<CR>
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

" OCaml
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
let g:opamshare = substitute(system('opam config var share'), '\n$', '', '''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']
"set rtp^="/Users/chris/.opam/system/share/ocp-indent/vim/indent/"

" Setup YouCompleteMe
let g:ycm_extra_conf_globalist = ['~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/*','!~/*']
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
au BufRead,BufNewFile *.cpp let g:ycm_show_diagnostics_ui = 0

" Setup UltiSnips
let g:UltiSnipsExpandTrigger = '<C-@>' " terminals send C-@ when C-Space is pressed
let g:UltiSnipsSnippetDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories  = ["UltiSnips"]
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
            return ""  " nothing more to do
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Setup CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Setup the MatchTagsAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml': 1,
    \ 'xml' : 1,
    \ 'php' : 1,
    \}
