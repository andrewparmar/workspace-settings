set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'itchyny/lightline.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ekalinin/Dockerfile.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2


" LIGHTLINE SETTINGS
let g:lightline={
      \ 'colorscheme': 'one',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:dracula_italic=0
colorscheme dracula
highlight Normal ctermbg=None
let g:dracula_colorterm=0

" MANUAL SETTINGS
"colorscheme monokai
syntax on
set mouse=n
set termguicolors
set number
set cursorline
set incsearch
set hlsearch
"set backspace=indent,eol,start
set cc=100


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Fix navigation through the wrapped lines.
nnoremap j gj
nnoremap k gk

" mode cursor settings
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

nnoremap <CR> :noh<CR><CR>

set clipboard=unnamed

vnoremap \y y:call system("pbcopy", getreg("\""))<CR>
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

" Remove trailing whitespaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
