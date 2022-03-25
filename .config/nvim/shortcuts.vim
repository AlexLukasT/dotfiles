let NERDTreeMapActivateNode = "l" 
let NERDTreeMapCloseDir = "h"

" set a map leader key to access custom shortcuts
let mapleader = " "

" custom keybindings to use with leader key
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <silent> <leader>f :NvimTreeFindFile<CR>
nnoremap <leader>v :wincmd v \| wincmd l<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" lsp mappings
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>gs    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>gt    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> <leader>gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>ca    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>d     <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
" Goto previous/next diagnostic warning/error
nnoremap <silent> <leader>E     <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>e     <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

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

" use leader + o to insert a new line without entering insert mode
nmap <leader>o o<Esc>
nmap <leader><S-o> O<Esc>

" copy to system clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>y  "+y
nnoremap <leader>p "+p
noremap <leader>p "+p

" search for selected text by typing '//'
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" disable key maps for gitgutter
let g:gitgutter_map_keys = 0

" disable command history (q:) to not open it accidentally
nnoremap q: <nop>

" do not create default mappings for nerdcommenter
let g:NERDCreateDefaultMappings = 0

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>a :Ag<CR>
