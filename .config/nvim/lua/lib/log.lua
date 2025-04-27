local levels = vim.log.levels

---@class log
local M = {}

function M.error(msg)
  vim.notify(msg, levels.ERROR)
end

function M.warning(msg)
  vim.notify(msg, levels.WARN)
end

return M
