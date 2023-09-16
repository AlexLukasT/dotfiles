local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>a", builtin.live_grep, {})

local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		-- use ripgrep to search in files
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},

		-- place the input propmt at the top
		layout_config = {
			prompt_position = "top",
		},

		-- start with result items on the top
		sorting_strategy = "ascending",

		mappings = {
			-- use shortcuts from fzf
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<esc>"] = actions.close,
			},
			n = {
				["<esc>"] = actions.close,
			},
		},
	},

	pickers = {
		-- use fd to search files
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
	},

	-- https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-setup-and-configuration
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})

require("telescope").load_extension("fzf")
