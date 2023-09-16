-- https://github.com/folke/lazy.nvim#-installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },

	{ "ThePrimeagen/harpoon" },

	{ "nvim-telescope/telescope.nvim", tag = "0.1.3" },

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{ "nvim-lualine/lualine.nvim" },

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	{ "tpope/vim-fugitive" },

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	},

	{ "simrat39/rust-tools.nvim" },

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	{ "lewis6991/gitsigns.nvim" },

	{ "lukas-reineke/indent-blankline.nvim" },

	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

	{ "HiPhish/rainbow-delimiters.nvim" },

	{ "mhartington/formatter.nvim" },

	{ "numToStr/Comment.nvim", lazy = false },

	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{ "nvimdev/lspsaga.nvim" },

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {},
	},

	{ "folke/zen-mode.nvim", opts = {} },

	{ "f-person/git-blame.nvim" },
})
