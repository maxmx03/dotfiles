local harpoon = require 'harpoon'
local M = {}

M.quick_menu = function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

M.append_list = function()
  harpoon:list():append()
end

return M
