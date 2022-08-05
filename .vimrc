" Plugins
" =======

call plug#begin('~/.vim/plugged')

" Dependency for fuzzy file sarching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Initialize plugin system
call plug#end()


" Plugin options
" ==============

" Ale
let g:ale_linters = {
\   'python': ['pylint']
\}

let g:ale_completion_enabled = 0


" Key bindings
" ============

" Fuzzy searching
map ; :GFiles<CR>
map <c-p> :Files<CR>
map <c-b> :Buffers<CR>

" Easy window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" Others
" ======

" Set encoding
set encoding=utf-8

" Enable syntax highlighting
syntax on

" Enable line numbers
set nu
set numberwidth=4

" Optimize searching
set incsearch hlsearch
set smartcase ignorecase
set showmatch

" Status bar
set laststatus=2
set ruler

" Indent automatically
set autoindent
set smartindent

" Splitting made easy
set splitright
set splitbelow

" Disable modelines as a security precaution
set modelines=0 nomodeline

set cursorline
set colorcolumn=80

" Display incomplete commands
" Imported from
" https://github.com/thoughtbot/dotfiles/blob/master/vimrc
set showcmd

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" Shell for syntax highlighting purposes.
let g:is_posix = 1

" Insert 4 spaces when tab key is pressed
set tabstop=4
set shiftwidth=4
set expandtab
