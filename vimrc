" rafaelmartins' vimrc.

" Some ugly hacks to initialize vim using our custom stuff
source $SYSTEM_VIMRC
execute "source ".$MY_VIM_DIR."/bundle/pathogen/autoload/pathogen.vim"

" Load pathogen
call pathogen#infect($MY_VIM_DIR."/bundle/{}")
call pathogen#helptags()

" Enable 256 colors for terminal and set colorscheme
set t_Co=256
set t_ut=
colorscheme jellybeans

" Disable vi compatibility
set nocompatible

" Enable line number
set number

" Enable syntax highlight
syntax on

" Set search options
set incsearch
set hlsearch

" Set default indentation options
set sw=4
set ts=4
set sts=4
set smarttab
set expandtab
set autoindent

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.

" Make syntastic auto update the location list and make it also check
" when the file opens
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1

" Airline
let g:airline_powerline_fonts=0

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable filetype plugins and indention
filetype plugin indent on

" activate a permanent ruler and disable Toolbar, and add line
" highlightng as well as numbers.
" also highlight current line and disable the blinking cursor.
set ruler
set guioptions-=T
set gcr=a:blinkon0
set ttyfast

" customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full

" autoread
set autoread

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set laststatus=2
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set showcmd

" utf-8 default encoding
set enc=utf-8

" prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" don't bell or blink
set noerrorbells
set vb t_vb=

" keep some more lines for scope
set scrolloff=5

" hide some files and remove stupid help
let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

" Colorcolumns
if version >= 703
  autocmd FileType * setlocal colorcolumn=0
  autocmd FileType ruby,python,javascript,c,cpp,objc,rst
    \ let &colorcolumn="80,".join(range(84,300),",")
endif

" python support
" --------------
" don't highlight exceptions and builtins. I love to override them in local
" scopes and it sucks ass if it's highlighted then. And for exceptions I
" don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
  \ formatoptions=croqj softtabstop=4 textwidth=74 comments=:#\:,:#
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1

let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_c_checkers=['make']
