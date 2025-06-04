---@class core
local M = {}

---@param name string
---@return string
function M.include(name)
  return vim.fn.stdpath 'config' .. '/lua/core/' .. name
end

return M
