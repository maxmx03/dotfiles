local M = {}

local function close_floats(floats)
  for window, bufnr in pairs(floats) do
    vim.api.nvim_win_close(window, true)
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
end

local function open_floats(mapping)
  local float_height = 3
  local float_width = 6
  local floats = {}
  for key, window in pairs(mapping) do
    local bufnr = vim.api.nvim_create_buf(false, true)
    if bufnr > 0 then
      local win_width = vim.api.nvim_win_get_width(window)
      local win_height = vim.api.nvim_win_get_height(window)
      local row = math.max(0, math.floor((win_height / 2) - 1))
      local col = math.max(0, math.floor((win_width / 2) - float_width))
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, { '', '  ' .. key .. '  ', '' })
      vim.api.nvim_buf_add_highlight(bufnr, 0, 'Bold', 1, 0, -1)
      local float_window = vim.api.nvim_open_win(bufnr, false, {
        relative = 'win',
        win = window,
        row = row,
        col = col,
        width = #key == 1 and float_width - 1 or float_width,
        height = float_height,
        focusable = false,
        style = 'minimal',
        border = 'single',
        noautocmd = true,
      })
      vim.api.nvim_set_option_value('winhl', 'Normal:Normal', { win = float_window })
      vim.api.nvim_set_option_value('diff', false, { win = float_window })
      floats[float_window] = bufnr
    end
  end
  vim.cmd 'redraw'
  return floats
end

M.pick = vim.schedule_wrap(function()
  local list = vim.tbl_filter(function(id)
    return vim.api.nvim_win_get_config(id).relative == ''
  end, vim.api.nvim_tabpage_list_wins(0))
  local windows = {}
  for i, win in ipairs(list) do
    local option = tostring(i)
    windows[option] = win
  end
  if vim.tbl_count(windows) < 2 then
    return
  end
  local floats = open_floats(windows)
  vim.ui.input({ prompt = 'Pick window' }, function(option)
    local ok = pcall(vim.api.nvim_set_current_win, windows[option])
    if not ok then
      close_floats(floats)
      vim.notify('Pick window: No valid window selected.', vim.log.levels.ERROR)
    else
      close_floats(floats)
    end
  end)
end)

return M
