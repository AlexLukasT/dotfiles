-- custom color for indent lines
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#3d3d3d gui=nocombine]])

require("indent_blankline").setup({
	char_highlight_list = {
		"IndentBlanklineIndent1",
	},
	char = "┊",
	-- char_blankline = " ",
})
