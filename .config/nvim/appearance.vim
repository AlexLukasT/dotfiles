set termguicolors

let g:everforest_transparent_background = 1

colorscheme everforest  "set colorscheme

let g:lightline = {
      \ 'colorscheme': 'everforest',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ],
      \ }
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

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
