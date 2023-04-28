local neovim_version = vim.version()
local lazy_plugins = require('lazy').stats().count
math.randomseed(os.time())
local list_ascii = require 'static.ascii'
local ascii = list_ascii[math.random(#list_ascii)]
local footer = string.format(
  [[
Version: v%s.%s.%s
Plugins: %s installed
]],
  neovim_version.major,
  neovim_version.minor,
  neovim_version.patch,
  lazy_plugins
)

return {
  header = ascii,
  items = {
    {
      section = 'Explore',
      name = 'Projects',
      action = 'Telescope projects',
    },
    {
      section = 'Explore',
      name = 'Files',
      action = 'Telescope find_files',
    },
    {
      section = 'Explore',
      name = 'Open Tree',
      action = 'NvimTreeOpen',
    },
    {
      section = 'Explore',
      name = 'Plugin Manager',
      action = 'Lazy',
    },
    {
      section = 'Explore',
      name = 'Package Manager',
      action = 'Mason',
    },
    {
      section = 'Action',
      name = 'Quit',
      action = 'quit',
    },
  },
  footer = footer,
}
