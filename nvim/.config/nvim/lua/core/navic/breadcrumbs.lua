local icons = require 'core.navic.icons'
local M = {}

local function isempty(s)
  return s == nil or s == ''
end

local function get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

M.get_filename = function()
  local filename = vim.fn.expand '%:t'
  local extension = vim.fn.expand '%:e'

  if not isempty(filename) then
    local file_icon, hl_group
    local devicons = require 'nvim-web-devicons'
    file_icon, hl_group = devicons.get_icon(filename, extension, { default = true })

    if isempty(file_icon) then
      file_icon = icons.kind.File
    end

    local buf_ft = vim.bo.filetype

    if buf_ft == 'dapui_breakpoints' then
      file_icon = icons.ui.Bug
    end

    if buf_ft == 'dapui_stacks' then
      file_icon = icons.ui.Stacks
    end

    if buf_ft == 'dapui_scopes' then
      file_icon = icons.ui.Scopes
    end

    if buf_ft == 'dapui_watches' then
      file_icon = icons.ui.Watches
    end

    local navic_text = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
    vim.api.nvim_set_hl(0, 'Winbar', { fg = navic_text.fg })

    return ' ' .. '%#' .. hl_group .. '#' .. file_icon .. '%*' .. ' ' .. '%#Winbar#' .. filename .. '%*'
  end
end

local get_gps = function()
  local status_gps_ok, gps = pcall(require, 'nvim-navic')
  if not status_gps_ok then
    return ''
  end

  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return ''
  end

  if not gps.is_available() or gps_location == 'error' then
    return ''
  end

  if not isempty(gps_location) then
    return '%#NavicSeparator#' .. icons.ui.ChevronRight .. '%* ' .. gps_location
  else
    return ''
  end
end

local excludes = function()
  local files = {
    'starter',
    'help',
    'startify',
    'dashboard',
    'lazy',
    'neo-tree',
    'neogitstatus',
    'NvimTree',
    'Trouble',
    'alpha',
    'lir',
    'Outline',
    'spectre_panel',
    'toggleterm',
    'DressingSelect',
    'Jaq',
    'harpoon',
    'dap-repl',
    'dap-terminal',
    'dapui_console',
    'dapui_hover',
    'lab',
    'notify',
    'noice',
    'neotest-summary',
    '',
  }

  return vim.tbl_contains(files, vim.bo.filetype)
end

M.get_winbar = function()
  if excludes() then
    return
  end
  local value = M.get_filename()

  local gps_added = false
  if not isempty(value) then
    local gps_value = get_gps()
    value = value .. ' ' .. gps_value
    if not isempty(gps_value) then
      gps_added = true
    end
  end

  if not isempty(value) and get_buf_option 'mod' then
    -- TODO: replace with circle
    local mod = '%#LspCodeLens#' .. icons.ui.Circle .. '%*'
    if gps_added then
      value = value .. ' ' .. mod
    else
      value = value .. mod
    end
  end

  local num_tabs = #vim.api.nvim_list_tabpages()

  if num_tabs > 1 and not isempty(value) then
    local tabpage_number = tostring(vim.api.nvim_tabpage_get_number(0))
    value = value .. '%=' .. tabpage_number .. '/' .. tostring(num_tabs)
  end

  local status_ok, _ = pcall(vim.api.nvim_set_option_value, 'winbar', value, { scope = 'local' })
  if not status_ok then
    return
  end
end

M.create_winbar = function()
  vim.api.nvim_create_augroup('_winbar', {})
  if vim.fn.has 'nvim-0.8' == 1 then
    vim.api.nvim_create_autocmd({
      'CursorHoldI',
      'CursorHold',
      'BufWinEnter',
      'BufFilePost',
      'InsertEnter',
      'BufWritePost',
      'TabClosed',
      'TabEnter',
    }, {
      group = '_winbar',
      callback = function()
        local status_ok, _ = pcall(vim.api.nvim_buf_get_var, 0, 'lsp_floating_window')
        if not status_ok then
          -- TODO:
          require('core.navic.breadcrumbs').get_winbar()
        end
      end,
    })
  end
end

return M
