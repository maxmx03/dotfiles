local M = {}

---@param lhs string
---@param rhs string | function
M.nmap = function(lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', lhs, rhs, opts)
end

---@param lhs string
---@param rhs string | function
M.tmap = function(lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.keymap.set('t', lhs, rhs, opts)
end

---@param lhs string
---@param rhs string | function
---@param opts table | nil
M.vmap = function(lhs, rhs, opts)
  vim.keymap.set('v', lhs, rhs, opts)
end

return M
