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
"set nohlsearch

" https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden

" turn hybrid line numbers on
set number relativenumber
set nu rnu

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
" Plug 'valloric/youcompleteme'  "autocompletion
Plug 'vim-airline/vim-airline'  "status bar
"Plug 'ctrlpvim/ctrlp.vim'  "file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'rking/ag.vim'  "text search
Plug 'tpope/vim-commentary'  "easy commenting
Plug 'neoclide/coc.nvim', {'branch': 'release'}  "autocompletion
Plug 'majutsushi/tagbar'  "ctags
Plug 'preservim/nerdcommenter'  "commenting
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'airblade/vim-gitgutter'
Plug 'ayu-theme/ayu-vim'
Plug 'psf/black', { 'branch': 'stable' }

call plug#end()

"set termguicolors
"let ayucolor="mirage"
colorscheme gruvbox  "set colorscheme

" make colorscheme background transparent to use default terminal background
hi Normal guibg=None ctermbg=None  

" fix hightlight of current line number with transparent background
hi CursorLineNr ctermbg=None guibg=None

" fix background color of split lines with transparent background
hi VertSplit ctermbg=None

" make the bar displaying erros transparent
hi SignColumn ctermbg=None guibg=None

" fix background color for gitgutter symbols
hi GitGutterAdd    guibg=None ctermbg=None guifg=#009900 ctermfg=2
hi GitGutterChange guibg=None ctermbg=None guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guibg=None ctermbg=None guifg=#ff2222 ctermfg=1

" always show the sign column to avoid text moving
set signcolumn=yes

" open nerdtree automatically even when no files are specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeMapActivateNode = "l" 
let NERDTreeMapCloseDir = "h"

" remap escape key
"inoremap jk <Esc>

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
nnoremap <leader>v :wincmd v \| wincmd l<CR>
"nnoremap <C-p> :GFiles<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
" use GFiles if in repository, else Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"

" open definition in a new tab
"nnoremap <silent> <leader>vgt :vsplit \| :wincmd l \| YcmCompleter GoTo<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Coc: use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc goto code navigation
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" mappings for coc list
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" coc open definition in a new tab
nnoremap <silent> <leader>gv :vsplit \| wincmd l \| <Plug>(coc-definition)<CR>

" block jump using curly braces
nnoremap <silent> <S-j> }
nnoremap <silent> <S-k> {

" add a semicolon at the end of the line
"nnoremap <leader>sc <C-o>A;

" move selected lines up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vmap <silent> <leader># <plug>NERDCommenterToggle<CR>
nmap <silent> <leader># <plug>NERDCommenterToggle<CR>

" automatic docstring generation in Python
nmap <silent> <leader>d <Plug>(pydocstring)
let g:pydocstring_formatter = 'numpy'
let g:pydocstring_doq_path = '/home/alex/.local/bin/doq'

" run current python file
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" use leader + o to insert a new line without entering insert mode
nmap <leader>o o<Esc>
nmap <leader><S-o> O<Esc>

" copy to system clipboard
set clipboard+=unnamedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
nnoremap <leader>p "+p
noremap <leader>p "+p

" disable key maps for gitgutter
let g:gitgutter_map_keys = 0

" search for selected text by typing '//'
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" show documentation in preview window
nnoremap <silent> <leader>b :call <SID>show_documentation()<CR>

" autoformat python files on save
autocmd BufWritePre *.py execute ':Black'
