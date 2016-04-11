

call plug#begin('~.vim/plugged')

Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'ervandew/supertab'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'reedes/vim-colors-pencil'
Plug 'elzr/vim-json'
Plug 'Raimondi/delimitMate'
Plug 'wikitopian/hardmode'
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()



" ================ General Config ====================

syntax on

set nocompatible                " Vim not vi

set title                       " Show the filename in the window titlebar
set visualbell                  " No error sounds
set nostartofline               " Don’t reset cursor to start of line when moving around
set laststatus=2                " Always show a status
set scrolloff=8                 " Start scrolling when we're 8 lines away from margins
set clipboard=unnamed           " Use the OS clipboard by default

set splitbelow                  " New window goes below
set splitright                  " New windows goes right

set shell=/bin/bash             " Use bash shell

set encoding=utf8              " Use UTF-8
set t_Co=256                     " use bright colors
set background=dark             " Dark syntax

set number                      " Line numbers are good
set ruler                       " Line and column number of the cursor position

set showcmd                     " Show incomplete cmds
set showmode                    " Show current mode

set backspace=indent,eol,start  " Allow backspace in insert mode

set autoindent                  " Auto indent
set smartindent                 " Smart Auto indent
set smarttab                    " Smart Auto tab
set expandtab                   " Expand tabs to spaces
set shiftwidth=2                " Number of spaces in a shift
set softtabstop=2               " Number of spaces in a soft tab
set tabstop=2                   " Number of spaces in a hard tab"

set textwidth=0                 " Do not wrap words (insert)
set nowrap                      " Do not wrap words (view)

set ttimeout                    " Key timeout
set ttimeoutlen=50              " Limit key timeout

set history=1000                " Store lots of :cmdline history

set incsearch                   " Find the next match as we type the search
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...unless we type a capital

set autoread                    " Reload files changed outside vim

set wildmenu
set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/**

set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set noswapfile

let mapleader=","               " Use more intuitive leader

filetype plugin indent on
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript  " Treat .json files as .js
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown            " Treat .md files as Markdown

highlight link xmlEndTag xmlTag




" ================ Windows ==========================

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>






" ================ Search ===========================

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>






" ================ CtrlP ============================

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore node_modules
      \ --ignore "**/*.pyc"
      \ -g ""'






" ================ Netrw ============================

let g:netrw_liststyle=3         " thin (change to 4 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertical






" ================ Whitespace =======================

function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

autocmd BufWritePre * call StripWhitespace()






" ================ Airline ==========================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tmuxline#snapshot_file = "~/.tmuxline.conf"
let g:airline_theme='pencil'






" ================ Tmuxline =========================

let g:tmuxline_preset = {
  \'win'  : ['#I', '#W'],
  \'cwin' : ['#I', '#W'],
  \'options': {
  \'status-justify': 'left'}}






" ================ AutoComplete =====================

highlight Pmenu ctermfg=1 ctermbg=8






" ================ CtrlP ============================

let g:ctrlp_match_window = 'top'






" ================ Syntastice =======================

let g:syntastic_javascript_checkers = ['standard']

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0





" ================ JavaScript =======================

let g:jsx_ext_required = 0






" ================ JSON =============================

let g:vim_json_syntax_conceal = 0






" ================ Color Scheme  ====================

colorscheme pencil

let g:pencil_neutral_code_bg = 1
let g:pencil_higher_contrast_ui = 1
let g:pencil_gutter_color = 1
let g:pencil_terminal_italics = 1






" ================ Hard Mode  =======================

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

