local function close_floats(floats)
  for window, bufnr in pairs(floats) do
    vim.api.nvim_win_close(window, true)
    vim.api.nvim_buf_delete(bufnr, { force = true })
  end
end

local function open_floats(diagnostics)
  local bufnr = vim.api.nvim_create_buf(false, true)
  local floats = {}
  local icons_util = require 'utils.icons'
  if bufnr > 0 then
    local lines = {}
    for _, diagnostic in ipairs(diagnostics) do
      local icons = {
        [vim.diagnostic.severity.ERROR] = icons_util.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons_util.diagnostics.Warning,
        [vim.diagnostic.severity.HINT] = icons_util.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons_util.diagnostics.Information,
      }
      local message = string.format('%s %s', icons[diagnostic.severity], diagnostic.message)
      table.insert(lines, '  ' .. message .. '  ')
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, true, lines)
    local i = 1
    local severity = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
      [vim.diagnostic.severity.HINT] = 'DiagnosticHint',
      [vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
    }
    for _, diagnostic in ipairs(diagnostics) do
      vim.api.nvim_buf_add_highlight(bufnr, 0, severity[diagnostic.severity], (i - 1), 0, -1)
      i = i + 1
    end
    local screen_width = vim.o.columns
    local screen_height = vim.o.lines
    local float_width = vim.fn.max(vim.tbl_map(function(diag)
      return #diag.message
    end, diagnostics)) + 4
    local float_height = #lines
    local row = screen_height * 0.05
    local col = screen_width - float_width - 2
    local float_window = vim.api.nvim_open_win(bufnr, false, {
      relative = 'editor',
      row = row,
      col = col,
      width = float_width,
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
  vim.cmd 'redraw'
  return floats
end

local M = {}

M.floats = {}

M.setup = function()
  vim.diagnostic.handlers['diag/notifier'] = {
    show = function(_, _, diagnostics)
      if vim.tbl_count(diagnostics) > 5 then
        M.floats = open_floats(diagnostics)
      end
    end,
    hide = function()
      close_floats(M.floats)
      M.floats = {}
    end,
  }
end

return M
