-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>pv", ":Ex<CR>", {})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("n", "J", "mzJ`z", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "n", "nzzzv", {})
vim.keymap.set("n", "N", "Nzzzv", {})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], {})

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {})
vim.keymap.set("n", "<leader>Y", [["+Y]], {})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], {})

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", {})

vim.keymap.set("n", "Q", "<nop>", {})
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {})
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {})
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})

vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("n", "<C-e>", ":Ex<CR>", { silent = true})
vim.keymap.set("n", "<C-c>", "<c-w>c", {})

vim.keymap.set("n", "<C-n>", ":vs<CR>", {})

vim.keymap.set("n", "<C-k>", "<c-w>k", {})
vim.keymap.set("n", "<C-j>", "<c-w>j", {})
vim.keymap.set("n", "<C-l>", "<c-w>l", {})
vim.keymap.set("n", "<C-h>", "<c-w>h", {})
vim.keymap.set("n", "<C-h>", "<c-w>h", {})
vim.keymap.set("n", "<C-t><C-t>", ":e /mnt/c/Users/bnamaral/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json<CR>", {})

