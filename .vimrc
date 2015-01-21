set nocompatible
set shell=bash
set fileformats=unix
set ignorecase
set smartcase

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
set shiftwidth=4
set tabstop=4

" Moving Around
" Treat long lines as break lines
map j gj
map k gk

" Fix ctrl-c differences from esc
map  <Esc>
map!  <Esc>

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
:nnoremap <F5> :buffers<CR>:buffer<Space>
let g:rbpt_colorpairs = [
    \ ['brown', 'RoyalBlue3'],
    \ ['Darkblue', 'SeaGreen3'],
    \ ['darkgray', 'DarkOrchid3'],
    \ ['darkgreen', 'firebrick3'],
    \ ['darkcyan', 'RoyalBlue3'],
    \ ['darkred', 'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown', 'firebrick3'],
    \ ['gray', 'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue', 'firebrick3'],
    \ ['darkgreen', 'RoyalBlue3'],
    \ ['darkcyan', 'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['red', 'firebrick3'],
    \ ]

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
