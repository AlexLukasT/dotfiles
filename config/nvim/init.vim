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
Plug 'ctrlpvim/ctrlp.vim'  "file finder
Plug 'rking/ag.vim'  "text search
Plug 'tpope/vim-commentary'  "easy commenting
Plug 'neoclide/coc.nvim', {'branch': 'release'}  "autocompletion
Plug 'majutsushi/tagbar'  "ctags

call plug#end()

colorscheme gruvbox  "set colorscheme

" make colorscheme background transparent to use default terminal background
hi Normal guibg=None ctermbg=None  

" fix hightlight of current line number with transparent background
hi CursorLineNr ctermbg=None guibg=None

" fix background color of split lines with transparent background
hi VertSplit ctermbg=None

" make the bar displaying erros transparent
hi SignColumn ctermbg=None guibg=None

" open nerdtree automatically even when no files are specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeMapActivateNode = "l" 
let NERDTreeMapCloseDir = "h"

" remap escape key
inoremap jk <Esc>

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
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
"nnoremap <silent> <leader>gt :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

" open definition in a new tab
"nnoremap <silent> <leader>vgt :vsplit \| :wincmd l \| YcmCompleter GoTo<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Disable YouCompleteMe preview window
"set completeopt-=preview

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
nnoremap <silent> <leader>vgd :vsplit \| :wincmd l \| <Plug>(coc-definition)<CR>

" block jump using curly braces
nnoremap <silent> <S-j> }
nnoremap <silent> <S-k> {

" add a semicolon at the end of the line
inoremap <leader>sc <C-o>A;

" move selected lines up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
