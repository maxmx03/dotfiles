---@class base46
local M = {}
local fn = vim.fn

M.colorscheme = 'carbonfox'
M.transparency = 0

M.store = function()
  local state = fn.stdpath 'state'
  vim.fn.writefile({ M.colorscheme, M.transparency }, state .. '/base46.txt')
end

M.restore = function()
  local state = fn.stdpath 'state'
  local ok, theme = pcall(fn.readfile, state .. '/base46.txt')
  if not ok then
    return
  end
  M.colorscheme = theme[1]
  M.transparency = tonumber(theme[2])
end

M.reload = function()
  vim.cmd.colorscheme 'base46'
end

return M
