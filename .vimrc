source $VIMRUNTIME/defaults.vim
"let g:skip_defaults_vim = 1
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Package Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"call plug#begin('~/.config/vim/plugged')

"Plug 'tpope/vim-sensible'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'tpope/vim-fugitive'

"call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugin Manager Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " Be iMproved, required
filetype off                  " Temporarily turned off, restored after Vundle

" Set runtime path to include Vundle and initialize
set rtp+=~/.config/vim/bundle/Vundle.vim
call vundle#begin('~/.config/vim/bundle')

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'nginx.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'wikitopian/hardmode'
" Plugin 'Valloric/YouCompleteMe'   " TODO: Doesn't work as expected.

" End Vundle setup
call vundle#end()
filetype plugin indent on    " Enable filetype detection, plugins, and indentation

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
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

set laststatus=2    " Always show the status line, even with only one buffer open

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * ++nested colorscheme gruvbox

set cc=100
set hlsearch
set incsearch
set mouse=n
set rnu 
set number
set splitright
set termguicolors
set tabstop=4               " Tab width of 4 spaces
set shiftwidth=4            " Indentation width of 4 spaces
set expandtab               " Convert tabs to spaces
set ttimeoutlen=0           " Ensure immediate cursor change on mode switch
set clipboard=unnamed       " Use system clipboard
set foldmethod=indent       " Use indentation for folds
set autoindent
set smartindent
set smarttab
set belloff=all
set scrolloff=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert Mode
inoremap <Esc> <Esc>l        " Prevent cursor shift when exiting insert mode

" Normal Mode
" Move through wrapped lines properly (Using an inline comment causes the mapping errors)
"nnoremap j gj
"nnoremap k gk
" Just mapping gj or gk causes issues when moving to lines with relative line numbers.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <CR> :noh<CR><CR>   " Clear search highlights
nnoremap YY "+y<CR>          " Copy current line to system clipboard
nnoremap P "+gP<CR>          " Paste from system clipboard without overwriting register
nnoremap XX "+x<CR>          " Cut to system clipboard
nnoremap \p :call setreg("\"", system("pbpaste"))<CR>p  " Paste from system clipboard
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>  " Remove trailing whitespaces
nnoremap <C-Left> :tabprevious<CR>  " Switch tabs
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <leader>t i<C-R>=strftime('[%Y-%m-%d %a %I:%M %p] - ')<CR><Esc>
" Compile & Run C++/C Files
nnoremap ,l :w<CR>:!clear && g++ %:p && ./a.out<CR>
nnoremap ,m :w<CR>:!clear && gcc -std=c11 %:p && ./a.out<CR>

" Visual Mode
vnoremap \y y:call system("pbcopy", getreg("\""))<CR>  " Copy selection to clipboard

" JSON Formatting (commented out for now)
" map ,pj :execute '%!python -m json.tool' | w<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimEnter * silent !echo -ne "\e]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"    " Insert Mode: Beam
let &t_SR = "\<Esc>]50;CursorShape=2\x7"    " Replace Mode: Underline
let &t_EI = "\<Esc>]50;CursorShape=0\x7"    " Normal Mode: Block
autocmd VimLeave * silent !echo -ne "\e]50;CursorShape=1\x7"

" Highlight line with cursor
set cursorline


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Settings [TODO: Not autoloading, need to call:`set syntax=notes`, or `:syntax on`]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.config/vim
"augroup filetypedetect
  "autocmd!
  "autocmd BufNewFile,BufRead */rye_notes.txt set filetype=notes
"augroup END
"augroup force_syntax
  "autocmd!
  "autocmd BufRead,BufNewFile rye_notes.txt set syntax=notes | source ~/.config/vim/syntax/notes.vim
"augroup END
"augroup custom_syntax
  "autocmd!
  "autocmd FileType notes source ~/.config/vim/syntax/notes.vim
"augroup END

"augroup custom_syntax
  "autocmd!
  "" Ensure filetype is set to notes
  "autocmd BufRead,BufNewFile rye_notes.txt set filetype=notes
  "" Force syntax to load *after* filetype is set
"augroup END

"augroup force_notes_syntax
  "autocmd!
  "autocmd BufRead,BufNewFile */rye_notes.txt syntax on
  "autocmd BufRead,BufNewFile */rye_notes.txt set filetype=notes
  "autocmd FileType notes set syntax=notes | source ~/.config/vim/syntax/notes.vim
  "autocmd BufRead,BufNewFile */rye_notes.txt set syntax=notes
  "autocmd BufRead,BufNewFile */rye_notes.txt source ~/.config/vim/syntax/notes.vim
"augroup END
