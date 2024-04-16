local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

    { 'neovim/nvim-lspconfig', dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'j-hui/fidget.nvim', 'folke/neodev.nvim' } },

    { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }},

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'lewis6991/gitsigns.nvim',

    'folke/tokyonight.nvim', -- Theme
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    'BurntSushi/ripgrep', -- recommended for boosting telescope performance
    { 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } },


    'mbbill/undotree',
    'folke/zen-mode.nvim',
    'github/copilot.vim'

})
