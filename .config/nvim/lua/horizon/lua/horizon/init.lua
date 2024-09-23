local config = require 'horizon.config'
local dimmed = require 'horizon.highlights'

---@class horizon
local M = {}

M.config = config

---@param opts horizon.config
M.setup = function(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts or {})
end

M.load = function()
  if vim.g.colors_name then
    vim.cmd.hi 'clear'
  end

  if vim.fn.exists 'syntax_on' then
    vim.cmd.syntax 'reset'
  end

  vim.g.colors_name = 'horizon'
  dimmed.load(M.config)
end

return M
