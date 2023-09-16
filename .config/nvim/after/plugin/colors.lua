require("everforest").setup({
	transparent_background_level = 2,
})

vim.cmd.colorscheme("everforest")

require("lualine").setup({
	options = {
		theme = "everforest",
	},
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = { "italic" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
		},
		underlines = {
			errors = { "underline" },
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
		},
		inlay_hints = {
			background = true,
		},
	},
	sections = {
		lualine_c = {
			{ "filename", path = 1 }, -- shot the relative path
		},
	},
})
