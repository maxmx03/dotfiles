local function pick_window()
  local id = require('window-picker').pick_window()

  if not id then
    return vim.notify('Invalid window', vim.log.levels.WARN)
  end

  vim.api.nvim_set_current_win(id)
end

return pick_window
