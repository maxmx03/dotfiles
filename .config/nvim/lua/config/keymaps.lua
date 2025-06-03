local map = vim.keymap.set
local opts = { silent = true }

map('x', '<a-t>', ':!gemini table<cr>')
map('x', '<a-b>', ':!gemini br<cr>')
map('x', '<a-e>', ':!gemini en<cr>')
map('x', '<a-g>', ':!gemini grammar<cr>')
map('n', '<tab>', '<cmd>WindowPick<cr>', opts)
map('n', '<c-left>', '<c-w>h', opts)
map('n', '<c-right>', '<c-w>l', opts)
map('n', '<c-up>', '<c-w>k', opts)
map('n', '<c-down>', '<c-w>j', opts)


map('n', 'gt', '<cmd>MarkdownToggleTask<cr>', opts)
