syntax on

" basic settings
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'  "git commands
Plug 'scrooloose/nerdtree'  "file tree
Plug 'morhetz/gruvbox'  "gruvbox color scheme
Plug 'mbbill/undotree'  "changes tree
Plug 'valloric/youcompleteme'  "autocompletion
Plug 'vim-airline/vim-airline'  "status bar
Plug 'ctrlpvim/ctrlp.vim'  "file finder
Plug 'rking/ag.vim'  "text search

call plug#end()

colorscheme gruvbox  "set colorscheme
" make colorscheme background transparent to use default terminal background
hi Normal guibg=NONE ctermbg=NONE  

" open nerdtree automatically even when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeMapActivateNode = "l" 
let NERDTreeMapCloseDir = "h"

" remap escape key
inoremap jj <Esc>

" ignore files to seach for
let g:ctrlp_user_command = ['.git/']

" CtrlP uses ag by default
if executable('ag')
    " use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor\ --column

    " use ag in CtrlP for listing files
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" set a map leader key to access custom shortcuts
let mapleader = " "

" custom keybindings to use with leader key
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :NERDTreeFind<CR>
nnoremap <leader>v :wincmd v<CR>
nnoremap <leader>s :CtrlP<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
