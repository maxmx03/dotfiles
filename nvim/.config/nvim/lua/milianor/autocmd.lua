vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*.md',
  callback = function()
    vim.cmd 'set colorcolumn=80'
  end,
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
  pattern = '*.md',
  callback = function()
    vim.cmd 'set colorcolumn=99999'
  end,
})

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.*',
  callback = function()
    if vim.bo.filetype == 'help' then
      return
    end

    local discipline = require 'core.discipline'

    discipline.cowboy()
  end,
})

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = '*.*',
  callback = function()
    if vim.bo.filetype == 'help' then
      return
    end

    local discipline = require 'core.discipline'

    discipline.cowboy_gets_shot()
  end,
})
