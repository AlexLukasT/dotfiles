require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "vimdoc", "python", "rust", "javascript", "typescript" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
