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
set nocompatible
"set nohlsearch
set mouse=a

" https://medium.com/usevim/vim-101-set-hidden-f78800142855
set hidden

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" when a file is open in vim and edited elsewhere read it again,
" this is usually the case when making changes with git outside of vim
set autoread

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" fzf default command for :Files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" align comment delimiters on the left instead of following code indentation,
" this is especially necessary for Python because else Black will remove the
" indentation when formatting
let g:NERDDefaultAlign = "left"

" use tabsize of 2
autocmd FileType java,html,javascript,css,sh,bash,yaml,json,vim,xml,cpp,c,php,rust,typescript,typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2

" set better assembly syntax
autocmd BufNew,BufRead *.asm set ft=nasm

" disable safe write for parcel hot module reload: https://en.parceljs.org/hmr.html
set backupcopy=yes

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" Autoformat on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Formatters
" Prettier: npm i -g prettier
let g:neoformat_enabled_javascript= ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']
let g:neoformat_enabled_typescript= ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']


