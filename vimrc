" rafaelmartins' vimrc.

" Some ugly hacks to initialize vim using our custom stuff
source $SYSTEM_VIMRC
execute "source ".$MY_VIM_DIR."/bundle/pathogen/autoload/pathogen.vim"

" Load pathogen
call pathogen#infect($MY_VIM_DIR."/bundle/{}")
call pathogen#helptags()

" Enable 256 colors for terminal and set colorscheme
set t_Co=256
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
set autoindent

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable filetype plugins and indention
filetype plugin indent on

" activate a permanent ruler and disable Toolbar, and add line
" highlightng as well as numbers.
" And disable the sucking pydoc preview window for the omni completion
" also highlight current line and disable the blinking cursor.
set ruler
set guioptions-=T
set completeopt-=preview
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
set cmdheight=1
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
