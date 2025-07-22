local groups = require 'base46.groups'

---@alias themes1 'carbonfox' | 'darkplus' | 'doom-one' | 'gruvbox' | 'horizon' | 'dracula' | 'solarized'
---@alias themes2 'monokai-pro' | 'onedark' | 'oxocarbon' | 'tokyonight' | 'tomorrow-night' | 'gruber-darker'

---@class base46.config
---@field colorscheme themes1 | themes2
---@field transparency? boolean

---@class base46.init
local M = {}

---@type base46.config
M.config = {
  colorscheme = 'doom-one',
  transparency = false,
}

---@param opts base46.config
function M.setup(opts)
  M.config = vim.tbl_deep_extend('force', M.config, opts)
  vim.cmd.colorscheme(M.config.colorscheme)
end

function M.load()
  local palette = require('base46.palette.' .. M.config.colorscheme)
  groups.load_faces(palette, M.config)
end

---@param colorscheme themes1 | themes2
function M.load_theme(colorscheme)
  M.config = vim.tbl_deep_extend('force', M.config, { colorscheme = colorscheme })
  local palette = require('base46.palette.' .. M.config.colorscheme)
  groups.load_faces(palette, M.config)
end

return M
