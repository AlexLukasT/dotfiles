local lsp_zero = require("lsp-zero").preset({})

lsp_zero.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "<leader>i", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "<leader>E", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	-- jump to the definition in a new vertical buffer
	vim.keymap.set("n", "<leader>gv", ":vsplit | :wincmd l | lua vim.lsp.buf.definition()<CR>")
end)

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"tsserver",
		"rust_analyzer",
		"terraformls",
	},
	handlers = {
		lsp_zero.default_setup,
	},
})

local rust_tools = require("rust-tools")
rust_tools.setup({
	server = {
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
		end,
	},
})
