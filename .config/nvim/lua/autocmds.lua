local function augroup(name)
  return vim.api.nvim_create_augroup('milianor_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = augroup 'add_markdown_column',
  pattern = { '*.md', '*.norg' },
  command = 'set colorcolumn=80'
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  group = augroup 'remove_markdown_column',
  pattern = { '*.md', '*.norg' },
  command = 'set colorcolumn='
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup 'highlight_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})
