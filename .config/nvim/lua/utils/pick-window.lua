local M = {}

M.pick = vim.schedule_wrap(function()
  local opts = {
    prompt = 'Pick Window',
  }
  local options = {}
  local windows = {}

  for i, win in ipairs(vim.api.nvim_list_wins()) do
    local option = string.format('%sº Window', i)
    table.insert(options, option)
    windows[option] = win
  end

  if vim.tbl_count(windows) < 2 then
    return
  end

  vim.ui.select(options, opts, function(option)
    local ok = pcall(vim.api.nvim_set_current_win, windows[option])
    if not ok then
      vim.notify('Pick window: No valid window selected.', vim.log.levels.ERROR)
    end
  end)
end)

return M
