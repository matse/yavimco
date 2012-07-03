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

if has('mac')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
elseif has('unix')
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
else
  set guifont=DejaVu_Sans_Mono_for_Powerline:h12
endif

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

set showcmd
nmap <space> zz
nmap n nzz
nmap N Nzz
nnoremap <silent> <Leader>h gT
nnoremap <silent> <Leader>j :wincmd j<CR>
nnoremap <silent> <Leader>k :wincmd k<CR>
nnoremap <silent> <Leader>l gt

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

function! SuperCleverTab()
if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
  return "\<Tab>"
else
  if &omnifunc != ''
    return "\<C-X>\<C-O>"
  elseif &dictionary != ''
    return "\<C-K>"
  else
    return "\<C-N>"
  endif
endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

" Auto compile .haml files on save, but only
" if there's a .autocompilehaml file in the cwd.
" Depends on a `haml` executable. `sudo gem install haml`

au BufWritePost *.haml call HamlMake()

function! HamlMake()
ruby << EOF
in_file = VIM::Buffer.current.name
dirname = File.dirname in_file
if File.exists? dirname + "/.autohaml"
  out_file = in_file[0..-6] + ".html"
  VIM::command "silent !haml --require coffee-filter #{in_file} #{out_file}"
end
EOF
endfunction

if filereadable(".vimrc.local")
    source .vimrc.local
endif
