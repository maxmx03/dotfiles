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
    vim.cmd 'set colorcolumn=99999'
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup 'highlight_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'close_with_q',
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'query',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      'n',
      'q',
      '<cmd>close<cr>',
      { buffer = event.buf, silent = true }
    )
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'wrap_spell',
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'indentscope',
  pattern = { 'dashboard', 'lazy', 'NvimTree', 'help', '*.txt', 'toggleterm' },
  callback = function(data)
    vim.b[data.buf].miniindentscope_disable = true
  end,
})
