set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on

colorscheme solarized
let g:solarized_termcolors=256
set background=light
set number
set encoding=utf-8
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set foldenable
set foldmethod=syntax
set cursorline
let mapleader=','
let maplocalleader=','
"Options only for mvim
if has("gui_running")
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions+=c
endif

set laststatus=2
let g:Powerline_symbols='fancy'
set noshowmode
set guifont=Menlo\ for\ Powerline:h12