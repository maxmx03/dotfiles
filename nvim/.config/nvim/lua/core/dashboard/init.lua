local neovim_version = vim.version()
local lazy_plugins = require('lazy').stats().count
math.randomseed(os.time())
local list_ascii = require 'core.dashboard.ascii'
local headerAscii = list_ascii[math.random(#list_ascii)]
local neovim_full_version =
    string.format('Version: v%s.%s.%s', neovim_version.major, neovim_version.minor, neovim_version.patch)
local plugins = string.format('Plugins: %s installed', lazy_plugins)

local emmptyLine = string.rep(' ', vim.fn.strwidth(headerAscii[1]))

table.insert(headerAscii, 1, emmptyLine)
table.insert(headerAscii, 2, emmptyLine)

headerAscii[#headerAscii + 1] = emmptyLine
headerAscii[#headerAscii + 1] = emmptyLine

return {
  header = headerAscii,
  center = {
    {
      icon = ' ',
      desc = 'Projects',
      key = 'p',
      keymap = 'SPC s p',
      action = 'Telescope projects',
    },
    {
      icon = ' ',
      desc = 'Files',
      key = 'f',
      keymap = 'SPC s f',
      action = 'Telescope find_files',
    },
    {
      icon = ' ',
      desc = 'File explorer',
      key = 'n',
      keymap = 'SPC e',
      action = 'NvimTreeOpen',
    },
    {
      icon = '󰏖 ',
      desc = 'Plugins',
      key = 'l',
      keymap = 'SPC p p',
      action = 'Lazy',
    },
    {
      icon = '󰏖 ',
      desc = 'Packages',
      key = 'm',
      keymap = 'SPC m m',
      action = 'Mason',
    },
    {
      icon = '󰗼 ',
      desc = 'Quit',
      key = 'q',
      keymap = 'SPC q',
      action = 'quit',
    },
  },
  footer = { neovim_full_version, plugins },
}
