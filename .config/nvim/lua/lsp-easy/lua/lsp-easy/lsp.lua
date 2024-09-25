local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local mason_installer = require 'mason-tool-installer'
local lsp_config = require 'lspconfig'

local M = {}

M.config = {}

M.virtual_text = function(signs, virtual_text)
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config {
    virtual_text = virtual_text,
  }
end

M.servers = function(servers)
  for _, server in ipairs(servers) do
    lsp_config[server].setup(M.config)
  end
end

M.handlers = function(handlers)
  for server, handler in pairs(handlers) do
    local config = vim.tbl_deep_extend('force', M.config, handler)
    lsp_config[server].setup(config)
  end
end

---@param config lsp-easy.config
M.load = function(config)
  M.config = config.lspconfig
  mason.setup {}
  mason_lspconfig.setup(config.mason_lspconfig)
  mason_installer.setup(config.mason_installer)
  M.virtual_text(config.signs, config.virtual_text)
  M.servers(config.servers)
  M.handlers(config.handlers)
end

return M
