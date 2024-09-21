local config = require 'lsp-easy.config'
local lsp = require 'lsp-easy.lsp'
local null = require 'lsp-easy.null'

---@class lsp-easy
local M = {}

---@param opts lsp-easy.config
M.setup = function(opts)
  M.config = vim.tbl_deep_extend('force', config, opts or {})
  lsp.load(M.config)
  null.load(M.config)
end

return M
