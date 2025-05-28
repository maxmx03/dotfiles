local M = {}
---@type base46
local base46 = require 'base46'
local reload_eviline = require 'lib.eviline'

M.pick = function()
  local themes = vim.fn.readdir(vim.fn.stdpath 'config' .. '/lua/base46/themes')
  local options = vim.tbl_map(function(theme)
    return vim.fn.fnamemodify(theme, ':t:r')
  end, themes)
  vim.ui.select(options, {
    prompt = 'base46',
  }, function(theme)
    local change_theme = vim.schedule_wrap(function()
      base46.colorscheme = theme or base46.colorscheme
      base46.store()
      base46.reload()
      reload_eviline()
    end)
    change_theme()
  end)
end

return M
