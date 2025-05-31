local map = vim.keymap.set
local opts = { silent = true }

map('x', '<a-t>', ':!gemini table')
map('x', '<a-b>', ':!gemini br')
map('x', '<a-e>', ':!gemini en')
map('x', '<a-g>', ':!gemini grammar')
map('n', '+', '<c-a>', opts)
map('n', '-', '<c-x>', opts)
map('n', '<tab>', '<cmd>WindowPick<cr>', opts)
