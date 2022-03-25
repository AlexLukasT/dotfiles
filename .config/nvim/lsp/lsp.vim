" Javascript/Typescript
" npm install -g typescript typescript-language-server
lua require'lspconfig'.tsserver.setup{}

" Go
" go install golang.org/x/tools/gopls@latest
lua require'lspconfig'.gopls.setup{}

" Rust
source $HOME/.config/nvim/lsp/rust.vim

" Tab completion
source $HOME/.config/nvim/lsp/completion.vim
