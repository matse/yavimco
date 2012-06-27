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

let g:vicle_session_name    = 'vicle'
let g:vicle_session_window  = '0'

command! Execl call <SID>ExecuteCurrentLine()
silent! nnoremap <unique> <silent> <Leader>e :Execl<CR>
function! s:ExecuteCurrentLine()
  execute '!' . getline('.')
endfunction

nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
nnoremap <silent> <Leader>r :CtrlPMRU<CR>

autocmd VimLeave * :SessionSave
let g:SessionSaveDirectory="$HOME/.vimsessions"
let g:SessionFilePrefix=""
let g:SessionFileSuffix=".vim"
let g:SessionConfirmOverwrite=0

nnoremap <silent> <Leader>t :TlistToggle<CR>
let Tlist_Close_On_Select = 1
let Tlist_Process_File_Always = 1
let Tlist_GainFocus_On_ToggleOpen = 1
