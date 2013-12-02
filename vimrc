" rafaelmartins' vimrc.

" Load pathogen
call pathogen#infect()
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
set expandtab
set autoindent

" Display tabs and trailing spaces
set list
set listchars=tab:\ ¬,trail:.
