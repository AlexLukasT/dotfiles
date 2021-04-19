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

" when a file is open in vim and edited elsewhere read it again,
" this is usually the case when making changes with git outside of vim
set autoread

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
"Plug 'vim-airline/vim-airline'  "status bar
Plug 'itchyny/lightline.vim'
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
" Plug 'ayu-theme/ayu-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'dylanaraps/wal.vim'
Plug 'udalov/kotlin-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'puremourning/vimspector'
Plug 'skywind3000/asyncrun.vim'
" rainbow brackets
Plug 'luochen1990/rainbow'
" html snippets
Plug 'mattn/emmet-vim'
"Plug 'JalaiAmitahl/maven-compiler.vim'
"Plug 'mikelue/vim-maven-plugin'

call plug#end()

"set termguicolors
"let ayucolor="mirage"
colorscheme gruvbox  "set colorscheme
"colorscheme wal
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" make colorscheme background transparent to use default terminal background
hi Normal guibg=None ctermbg=None  

" fix hightlight of current line number with transparent background
hi CursorLineNr ctermbg=None guibg=None

" fix background color of split lines with transparent background
hi VertSplit ctermbg=None ctermfg=0
"set fillchars+=vert:\|

" make the bar displaying erros transparent
hi SignColumn ctermbg=None guibg=None

" fix background color for gitgutter symbols
hi GitGutterAdd    guibg=None ctermbg=None guifg=#009900 ctermfg=2
hi GitGutterChange guibg=None ctermbg=None guifg=#bbbb00 ctermfg=3
hi GitGutterDelete guibg=None ctermbg=None guifg=#ff2222 ctermfg=1

" fix highlighted lines with error for transparent background
hi CocErrorSign ctermbg=None ctermfg=Red
hi CocWarningSign ctermbg=None ctermfg=Brown
hi CocInfoSign ctermbg=None ctermfg=Yellow
hi CocHintSign ctermbg=None ctermfg=Blue

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
nmap <silent> <leader>e <Plug>(coc-diagnostic-next)
nmap <silent> <leader><S-e> <Plug>(coc-diagnostic-prev)

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
nnoremap <silent><nowait> <leader>d  :<C-u>CocList diagnostics<CR>

" coc open definition in a new tab
nmap <silent> <leader>gv :vsplit \| :wincmd l<CR><Plug>(coc-definition)
" this does the same but opens the definition in the current window
" and not the new one on the right
"nnoremap <silent> <leader>gv :call CocAction('jumpDefinition', 'vsplit')<CR>

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

" Format Python file on save with black
autocmd BufWritePre *.py execute ':Black'

" autoformat on save
"au BufWrite * :Autoformat

" disable command history (q:) to not open it accidentally
nnoremap q: <nop>

" fzf default command for :Files
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
" use GFiles if in repository, else Files
" nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<cr>"
nnoremap <C-p> :Files<CR>
nnoremap <leader>a :Ag<CR>

" use googles java formatter
let g:formatdef_google_java = '"java -jar /home/alex/software/bin/google-java-format-1.9-all-deps.jar -"'
let g:formatters_java = ['google_java']

" automatically format java files on save
let java_autoformat_on_save = 1
autocmd BufWritePre *.java execute ':Autoformat'

function JavaStartDebug()
    " due to a bug with vimspector ignoring the host configuration, the port
    " from the remote machine is forwarded first
    :AsyncRun ssh -N -L 5005:127.0.0.1:5005 host@remote
    :CocCommand java.debug.vimspector.start
endfunction

" start and close the remote java debugger using vimspector and coc-java-debug
" plugin
nmap <F1> :call JavaStartDebug()<CR>
nmap <F2> :VimspectorReset<CR>
let g:vimspector_enable_mappings = 'HUMAN'

" reverse text by visually selecting it and pressing ;rv
" see: https://vim.fandom.com/wiki/Reverse_selected_text
vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" align comment delimiters on the left instead of following code indentation,
" this is especially necessary for Python because else Black will remove the
" indentation when formatting
let g:NERDDefaultAlign = "left"

" Remove all trailing whitespace by pressing F7
" from: https://vim.fandom.com/wiki/Remove_unwanted_spaces#Simple_commands_to_remove_unwanted_whitespace
nnoremap <F7> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Remove all  (Hold Ctrl and press v followed by m), aka Windows newlines,
" by pressing F8
" from: https://stackoverflow.com/a/5843561
nnoremap <F10> :%s///g<CR>

" enable rainbow paranthesis
let g:rainbow_active = 1

" use tabsize of 2
autocmd FileType java,html,javascript,css,sh,bash,yaml,json,vim,xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

" compiler command to be run with :make for maven projects
"set makeprg=mvn\ -q\ -B\ clean\ compile\ exec:exec
" errorformat for maven projects from https://stackoverflow.com/a/13475393
"set errorformat=[ERROR]\ %f:[%l\\,%v]\ %m

" scrolling remapped
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" vscode like behaviour for ctrl+d
nmap <expr> <silent> <C-d> <SID>select_current_word()
function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc
