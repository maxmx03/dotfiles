vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  pattern = '*.*',
  command = 'update',
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*.md',
  callback = function()
    local utils = require 'milianor.utils'

    if not utils then
      return
    end

    vim.cmd 'set colorcolumn=100'
    utils:preview_markdown()
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = '*.md',
  callback = function()
    vim.cmd 'set colorcolumn=99999'
  end,
})
