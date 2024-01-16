local function augroup(name)
  return vim.api.nvim_create_augroup('milianor_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = augroup 'markdown_column_80',
  pattern = '*.md',
  callback = function()
    vim.cmd 'set colorcolumn=80'
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  group = augroup 'markdown_column_999999',
  pattern = '*.md',
  callback = function()
    vim.cmd 'set colorcolumn='
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup 'highlight_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})
