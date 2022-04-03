call plug#begin('~/.vim/plugged')

" Git commands and line symbols
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Lightline status bar
Plug 'itchyny/lightline.vim'

" Nvim Tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua' " side bar

" Colorscheme
Plug 'sainnhe/everforest'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Nerdcommenter for easy multiline commenting
Plug 'preservim/nerdcommenter'

" Nvim Cmp for tab completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Indent markers
Plug 'Yggdroot/indentLine'

" Rainbow colors
Plug 'p00f/nvim-ts-rainbow'

" Prettier
Plug 'sbdchd/neoformat'

call plug#end()
