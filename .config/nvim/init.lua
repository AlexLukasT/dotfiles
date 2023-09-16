require("remap")
require("plugins")
require("set")

-- Restore cursor position: https://stackoverflow.com/a/72939989
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

-- use tabsize of 2 for some files
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { 
        "java",
        "html",
        "javascript",
        "css",
        "sh",
        "bash",
        "yaml",
        "json",
        "vim",
        "lua",
        "xml",
        "cpp",
        "c",
        "php",
        "typescript",
        "typescriptreact"
     },
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.softtabstop = 2
        vim.opt.shiftwidth = 2
    end
})
