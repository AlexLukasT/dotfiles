lua <<EOF
local actions = require('telescope.actions')

require('telescope').setup{
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
      "--trim"
    },

    -- place the input propmt at the top
    layout_config = {
      prompt_position = "top"
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
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  }
}
EOF
