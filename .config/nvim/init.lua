--  Neovim config
--  __    __     __     __         __     ______     __   __     ______     ______
-- /\ "-./  \   /\ \   /\ \       /\ \   /\  __ \   /\ "-.\ \   /\  __ \   /\  == \
-- \ \ \-./\ \  \ \ \  \ \ \____  \ \ \  \ \  __ \  \ \ \-.  \  \ \ \/\ \  \ \  __<
--  \ \_\ \ \_\  \ \_\  \ \_____\  \ \_\  \ \_\ \_\  \ \_\\"\_\  \ \_____\  \ \_\ \_\
--   \/_/  \/_/   \/_/   \/_____/   \/_/   \/_/\/_/   \/_/ \/_/   \/_____/   \/_/ /_/
--
--  By maxmx03
--
-- --- Config and Plugins ---
---@type base46.config
vim.g.base46 = {
  colorscheme = vim.g.neovide and 'onedark' or 'solarized',
  transparency = not vim.g.neovide,
}
require 'config.globals'
require 'config.commands'
require 'config.keymaps'
require 'config.options'
require 'config.neovide'
require 'config.autocmds'
require 'config.lazyrc'
