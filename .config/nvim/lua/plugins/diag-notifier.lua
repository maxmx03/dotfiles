return {
  dir = vim.fn.stdpath 'config' .. '/lua/custom-plugins/diag-notifier',
  config = function()
    require('diag-notifier').setup()
  end,
}
