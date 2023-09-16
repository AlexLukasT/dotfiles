require("formatter").setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.javascript").prettier,
		},
		rust = {
			require("formatter.filetypes.rust").rustfmt,
		},
		terraform = {
			require("formatter.filetypes.terraform").terraform,
		},
	},
})

-- automatically format on save
vim.cmd([[autocmd BufWritePost * FormatWrite]])
