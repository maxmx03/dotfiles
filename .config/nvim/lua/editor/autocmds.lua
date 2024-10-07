local function augroup(name)
  return vim.api.nvim_create_augroup('user_autogroup_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = augroup 'colorcolumn_80',
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '80'
    vim.opt.textwidth = 80
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  group = augroup 'colorcolumn_120',
  pattern = { '*.md' },
  callback = function()
    vim.opt.colorcolumn = '120'
    vim.opt.textwidth = 120
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup 'on_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  group = augroup 'show_keys',
  once = true,
  callback = function()
    vim.defer_fn(function()
      require('showkeys').toggle()
    end, 3000)
  end,
})
