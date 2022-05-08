local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = { "python", "javascript", "c", "bash", "css", "dockerfile", "json", "typescript"},
    highlight = {
        enable = true
    }
}
