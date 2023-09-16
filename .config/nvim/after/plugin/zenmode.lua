local zen_mode = require("zen-mode")

vim.keymap.set("n", "<leader>z", function()
	zen_mode.toggle({
		window = {
			width = 0.9,
		},
	})
end)
