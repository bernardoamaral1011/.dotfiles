require("zen-mode").setup {
    window = {
        width = 100,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
end, {})
