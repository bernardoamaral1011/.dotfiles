require("bnamaral.set")
require("bnamaral.remap")
require("bnamaral.packer")

-- autocommands
-- Autocommands are the way to execute any vim actions (like setting an option or mapping a key) in response to various events
local augroup = vim.api.nvim_create_augroup
local std_augroup = augroup('bnamaral', {})

local autocmd = vim.api.nvim_create_autocmd

function R(name)
    require("plenary.reload").reload_module(name)
end

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

autocmd({"BufWritePre"}, {
    group = std_augroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
